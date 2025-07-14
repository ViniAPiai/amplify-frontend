part of 'sign_up.dart';

class _$SignUpDesktop extends StatelessWidget {
  const _$SignUpDesktop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        color: AppColors.gray,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 600,
              child: Column(
                children: [
                  Timeline(isFirst: true, step: TimelineStep.past, title: 'Informações básicas',),
                  Timeline(step: TimelineStep.current, title: 'Endereço',),
                  Timeline(step: TimelineStep.next, title: 'Informações pessoais'),
                  Timeline(step: TimelineStep.next,),
                  Timeline(isLast: true, step: TimelineStep.next,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
