part of 'crm.dart';

class _CrmDesktop extends StatefulWidget {
  const _CrmDesktop();

  @override
  State<_CrmDesktop> createState() => _CrmDesktopState();
}

class _CrmDesktopState extends State<_CrmDesktop> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<CrmBloc>().add(CrmLoadBoard());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    LocaleBloc localeBloc = context.read<LocaleBloc>();
    DateFormat dateFormat = DateFormat.yMEd(context.getLocaleString(localeBloc.state.locale));
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
                        children: List.generate(
                          state.columnsOrder.length,
                          (index) => _buildColumn(state.columnsOrder[index]),
                        ),
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

  Widget _buildColumn(String columnUuid) {
    return BlocBuilder<CrmBloc, CrmState>(builder: (context, state) {
      final column = state.columns[columnUuid]!;
      return LongPressDraggable<Map<String, dynamic>>(
        data: {'columnUuid': columnUuid, 'type': 'column'},
        feedback: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 400,
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
                    style: GoogleFonts.montserrat(color: AppColors.black, fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        childWhenDragging: Container(),
        child: DragTarget<Map<String, dynamic>>(
          onAcceptWithDetails: (data) {
            setState(() {
              final type = data.data['type'] as String;
              if (type == 'card') {
                final card = data.data['card'] as CardModel;
                final oldColumnUuid = data.data['columnUuid'] as String;
                final oldCardIndex = data.data['cardIndex'] as int;
                context.read<CrmBloc>().add(CrmChangeCardPosition(
                    card: card, oldColumnUuid: oldColumnUuid, oldCardIndex: oldCardIndex, columnUuid: columnUuid, sameColumn: false));
              } else if (type == 'column') {
                final oldColumnUuid = data.data['columnUuid'] as String;
                if (oldColumnUuid != columnUuid) {
                  context.read<CrmBloc>().add(CrmChangeColumnOrder(oldColumnUuid: oldColumnUuid, columnUuid: columnUuid));
                }
              }
            });
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 400,
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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      column.name,
                      style: GoogleFonts.montserrat(color: AppColors.black, fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: column.cards.length,
                      itemBuilder: (context, index) {
                        return DragTarget<Map<String, dynamic>>(
                          onAcceptWithDetails: (data) {
                            setState(() {
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
                                    sameColumn: true,
                                    newIndex: index));
                              }
                            });
                          },
                          builder: (context, candidateData, rejectedData) {
                            return _buildCard(columnUuid, index);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildCard(String columnUuid, int cardIndex) {
    return BlocBuilder<CrmBloc, CrmState>(
      builder: (context, state) {
        CardModel card = state.columns[columnUuid]!.cards[cardIndex];
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
                color: AppColors.gray,
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
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(6))
            ),
            child: Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                card.title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
      }
    );
  }
}
