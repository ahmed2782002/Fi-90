class OnboardingSlide {
  const OnboardingSlide({required this.title, required this.body});

  final String title;
  final String body;

  static const mock = [
    OnboardingSlide(
      title: 'واجه لاعب حقيقي',
      body: 'مباراة مباشرة ضد خصم أونلاين — دور بدور، والثواني بتعدّ.',
    ),
    OnboardingSlide(
      title: '4 تحديات في ماتش واحد',
      body: 'معلومات، مزاد، سرعة على الجرس، وفرصة أخيرة تقلب بيها النتيجة.',
    ),
    OnboardingSlide(
      title: 'اطلع في الترتيب',
      body: 'كل فوز بيديك XP. اطلع درجة ونافس أصحابك على المركز الأول كل أسبوع.',
    ),
  ];
}
