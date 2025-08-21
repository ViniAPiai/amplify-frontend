part of 'crm.dart';

class _CrmDesktop extends StatefulWidget {
  const _CrmDesktop();

  @override
  State<_CrmDesktop> createState() => _CrmDesktopState();
}

class _CrmDesktopState extends State<_CrmDesktop> with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    context.read<CrmBloc>().add(CrmLoadBoard());
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = ColorTween(
      begin: AppColors.primary,
      end: AppColors.primary,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBar(
        child: BlocListener<CrmBloc, CrmState>(
      listener: (context, state) {
        if (!state.isLoading) {}
      },
      child: SafeArea(
        child: Container(
          width: context.width,
          height: context.height,
          color: AppColors.gray,
          child: Column(
            spacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  spacing: 16,
                  children: [HeaderTitle(icon: Icons.developer_board, title: 'CRM'), Expanded(child: SizedBox()), LocaleChanger()],
                ),
              ),
              Divider(thickness: .5, color: AppColors.gray2),
              BlocBuilder<CrmBloc, CrmState>(builder: (context, state) {
                if (state.isLoading) {
                  return SizedBox(
                    width: context.width,
                    height: context.height - 150,
                    child: const Center(child: CircularProgressIndicator(color: AppColors.primary)),
                  );
                }
                return SizedBox(
                  height: context.height - 150,
                  width: context.width,
                  child: Scrollbar(
                    controller: _controller,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            state.columnsOrder.length,
                            (index) => _buildColumn(state.columnsOrder[index]),
                          ),
                          /*FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                fixedSize: Size(50, context.height - 150),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)
                                )
                              ),
                              child: Text(
                                t.crmColumnAddNewColumn.toUpperCase().replaceAll(' ', '_').split('').map((e) => e,).join('\n')*/ /*.replaceAll('_', ' ')*/ /*,
                                style: GoogleFonts.robotoMono(color: Colors.white, fontSize: 18),
                              )).paddingSymmetric(vertical: 16)*/
                        ],
                      ),
                    ),
                  ),
                ).paddingAll(16);
              })
            ],
          ),
        ),
      ),
    ));
  }

  /// Build a column with the given uuid
  /// The first drag target, is not for the column the card is and the second is for moving the card on the same colum

  Widget _buildColumn(String columnUuid) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return BlocBuilder<CrmBloc, CrmState>(
      builder: (context, state) {
        final column = state.columns[columnUuid]!;
        return LongPressDraggable<Map<String, dynamic>>(
          data: {'columnUuid': columnUuid, 'type': 'column'},
          feedback: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      column.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          childWhenDragging: Container(),
          child: DragTarget<Map<String, dynamic>>(
            onAcceptWithDetails: (data) {
              final type = data.data['type'] as String;
              if (type == 'card') {
                final card = data.data['card'] as CardModel;
                final oldColumnUuid = data.data['columnUuid'] as String;
                final oldCardIndex = data.data['cardIndex'] as int;
                context.read<CrmBloc>().add(CrmChangeCardPosition(
                    card: card,
                    oldColumnUuid: oldColumnUuid,
                    oldCardIndex: oldCardIndex,
                    columnUuid: columnUuid,
                    sameColumn: false,
                    newIndex: column.cards.length));
              } else if (type == 'column') {
                final oldColumnUuid = data.data['columnUuid'] as String;
                if (oldColumnUuid != columnUuid) {
                  context.read<CrmBloc>().add(CrmChangeColumnOrder(oldColumnUuid: oldColumnUuid, newIndex: state.columnsOrder.indexOf(columnUuid)));
                }
              }
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 300,
                height: MediaQuery.of(context).size.height - 100,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  border: candidateData.isNotEmpty ? Border.all(color: AppColors.primary, width: 2) : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          column.name,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        PopupMenuButton<String>(
                          position: PopupMenuPosition.under,
                          onSelected: (event) {
                            if (event == t.crmColumnMoveToLeft) {
                              context
                                  .read<CrmBloc>()
                                  .add(CrmChangeColumnOrder(oldColumnUuid: columnUuid, newIndex: state.columnsOrder.indexOf(columnUuid) - 1));
                            } else if (event == t.crmColumnMoveToRight) {
                              context
                                  .read<CrmBloc>()
                                  .add(CrmChangeColumnOrder(oldColumnUuid: columnUuid, newIndex: state.columnsOrder.indexOf(columnUuid) + 1));
                            } else if (event == t.delete) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                    alignment: Alignment.centerRight,
                                    insetPadding: EdgeInsets.all(16),
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          t.crmColumnDeleteColumn,
                                          style: GoogleFonts.montserrat(
                                            color: AppColors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.close, color: AppColors.black))
                                      ],
                                    ),
                                    content: SizedBox(
                                      width: 700,
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          spacing: 16,
                                          children: [
                                            Divider(
                                              color: AppColors.gray2,
                                              thickness: 2,
                                            ),
                                            Label(label: t.crmToConfirmColumnRemovalType(state.columns[columnUuid]!.name)),
                                            TextFormField(
                                              onChanged: (value) => context.read<CrmBloc>().add(CrmUpdateFields(excludeColumnName: value)),
                                              decoration: InputDecoration(border: OutlineInputBorder()),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return t.isMandatory.capitalizeFirst;
                                                }
                                                if (value != state.columns[columnUuid]!.name) {
                                                  return "";
                                                }
                                                return null;
                                              },
                                            ),
                                            Label(label: t.crmMoveCardsToColumn),
                                            DropdownButtonFormField<SimpleResponse>(
                                              decoration: InputDecoration(border: OutlineInputBorder()),
                                              value: state.selectedColumn,
                                              items: [
                                                SimpleResponse(uuid: '', name: ''),
                                                ...state.columns.values
                                                    .toList()
                                                    .where((element) => element.uuid != columnUuid)
                                                    .map((e) => e.toSimpleResponse())
                                              ].map(
                                                (e) {
                                                  return DropdownMenuItem<SimpleResponse>(
                                                    value: e,
                                                    child: Text(
                                                      e.name,
                                                      style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (value) => context.read<CrmBloc>().add(CrmUpdateFields(selectedColumn: value)),
                                              validator: (value) {
                                                if (value!.uuid == '') {
                                                  return t.isMandatory.capitalizeFirst;
                                                }
                                                return null;
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              context.read<CrmBloc>().add(CrmDeleteColumn(uuid: columnUuid));
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          child: Text(
                                            t.confirm,
                                            style: GoogleFonts.montserrat(color: AppColors.primary, fontSize: 18, fontWeight: FontWeight.w500),
                                          ))
                                    ],
                                  );
                                },
                              );
                            } else if (event == t.crmColumnAddNewColumn) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return BlocProvider(
                                    create: (context) => NewCrmColumnBloc()
                                      ..add(NewCrmColumnLoad(index: state.columnsOrder.indexOf(columnUuid), refColumnName: column.name)),
                                    child: NewCrmColumnModal(),
                                  );
                                },
                              );
                            }
                          },
                          color: Colors.white,
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                  value: t.crmColumnAddNewColumn,
                                  child: ListTile(title: Text(t.crmColumnAddNewColumn), leading: Icon(Icons.add, size: 16))),
                              PopupMenuDivider(),
                              if (state.columnsOrder.indexOf(columnUuid) < state.columnsOrder.length - 1)
                                PopupMenuItem(
                                    value: t.crmColumnMoveToRight,
                                    child: ListTile(title: Text(t.crmColumnMoveToRight), leading: Icon(Icons.arrow_forward, size: 16))),
                              if (state.columnsOrder.indexOf(columnUuid) > 0)
                                PopupMenuItem(
                                    value: t.crmColumnMoveToLeft,
                                    child: ListTile(title: Text(t.crmColumnMoveToLeft), leading: Icon(Icons.arrow_back, size: 16))),
                              PopupMenuDivider(),
                              PopupMenuItem(
                                  value: t.delete, child: ListTile(title: Text(t.delete), leading: Icon(FontAwesomeIcons.trashCan, size: 16))),
                            ];
                          },
                          icon: Icon(
                            Icons.more_horiz,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: column.cards.length,
                        itemBuilder: (context, index) {
                          return DragTarget<Map<String, dynamic>>(
                            onAcceptWithDetails: (data) {
                              final type = data.data['type'] as String;
                              if (type == 'card') {
                                final card = data.data['card'] as CardModel;
                                final oldColumnUuid = data.data['columnUuid'] as String;
                                final oldCardIndex = data.data['cardIndex'] as int;
                                context.read<CrmBloc>().add(CrmChangeCardPosition(
                                      card: card,
                                      oldColumnUuid: oldColumnUuid,
                                      oldCardIndex: oldCardIndex,
                                      columnUuid: columnUuid,
                                      sameColumn: oldColumnUuid == columnUuid,
                                      newIndex: index.clamp(0, column.cards.length),
                                    ));
                              }
                            },
                            builder: (context, candidateData, rejectedData) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  border: candidateData.isNotEmpty ? Border.all(color: AppColors.primary, width: 2) : null,
                                  borderRadius: BorderRadius.circular(8),
                                  color: candidateData.isNotEmpty ? Colors.grey[200] : Colors.transparent,
                                ),
                                child: _buildCard(column.cards[index], columnUuid, index),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    TextButton.icon(
                        onPressed: () => context.read<SideBarBloc>().add(ToggleNewCardModal(columnUuid: columnUuid)),
                        label: Text(
                          t.add,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.black),
                        ),
                        icon: Icon(
                          Icons.add,
                          color: AppColors.black,
                          size: 24,
                        ))
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCard(CardModel card, String columnUuid, int cardIndex) {
    return LongPressDraggable<Map<String, dynamic>>(
      data: {
        'card': card,
        'columnUuid': columnUuid,
        'cardIndex': cardIndex,
        'type': 'card',
      },
      feedback: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            card.title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      childWhenDragging: Container(),
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: card.type == CardTypeEnum.defaultType ? AppColors.gray : Colors.pinkAccent,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Column(
              children: [
                Text(
                  card.title,
                  style: const TextStyle(fontSize: 16),
                ).alignAtCenterLeft(),
                if (card.type == CardTypeEnum.defaultType)
                  Text(
                    card.extraData["description"],
                    style: const TextStyle(fontSize: 14),
                  ).alignAtCenterLeft(),
              ],
            )),
      ),
    );
  }

  String _toVerticalString(String text) {
    return text
        .replaceAll(' ', '_')
        .split('')
        .map(
          (e) => e,
        )
        .join('\n');
  }
}
