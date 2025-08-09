import 'package:safty_children/features/test/models/question_model.dart';

List<QuestionModel> stageTwoQuestions = [
  QuestionModel(

    question: '1- ما مفهوم الإسعافات الأولية؟',
    answers: [
      'الرعاية الفورية المقدمة للطفل المصاب قبل وصول المساعدة الطبية المتخصصة.',
      'العلاج الطبي الكامل الذي يقدم في المستشفى',
      'مساعدة الطفل المصاب بشكل سريع للحد من تدهور حالته',
      'تقنية تستخدم فقط من قبل الأطباء المدربين في غرف الطوارئ'
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(

    question: '2- ما هو الهدف الرئيسي من الإسعافات الأولية؟',
    answers: [
      'رعاية تستخدم لتشخيص الأمراض وعلاجها',
      'رعاية تستخدم لتقديم المساعدة الفورية ومنع تدهور الحالة',
      'رعاية تستخدم كبديل للعلاج الطبي',
      'رعاية تستخدم لتحسين حالة المريض وتعزيز شفائه'
    ],
    correctAnswer: [1, 3],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '3- ما هي مبادئ الإسعافات الأولية؟',
    answers: [
      'الحفاظ على حياة الأطفال',
      'تدهور الحالة',
      'تعزيز الشفاء',
      'زيادة معدل حدوث الأمراض في الأطفال'
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '4- ما هي التحديات التي تواجه أداء الإسعافات الأولية؟',
    answers: [
      'نقص المعرفة والتدريب',
      'العجز في الوصول إلى المعدات الطبية بسرعة',
      'الخوف من تنفيذ الإسعافات الأولية بشكل غير صحيح',
      'لا يوجد خطر لانتقال العدوى'
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '5- ما هي أنواع الإسعافات الأولية الشائعة في حالات الطوارئ للأطفال؟',
    answers: [
      'الإسعافات الأولية التنفسية مثل الاختناق',
      'التدخلات الجراحية المتقدمة لعلاج الإصابات',
      'حالات التسمم',
      'تشخيص الأمراض ووصف الأدوية'
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '6- ما مفهوم التسمم عند الأطفال؟',
    answers: [
      'حدوث خلل في وظائف جسم الطفل نتيجة تعرضه لمادة سامة',
      'تأثير ضار ناتج عن التعرض لمادة سامة عن طريق الفم أو الاستنشاق أو ملامسة الجلد',
      'مرض يؤثر فقط على الجهاز الهضمي',
      'تقديم رعاية فورية لمنع تدهور الحالة'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '7- ما أسباب التسمم عند الأطفال؟',
    answers: [
      'فضول الطفل ورغبته في استكشاف العالم من خلال الحواس',
      'هدوء الطفل',
      'انشغال الوالدين عن الطفل',
      'تناول الأدوية بالجرعات الموصى بها'
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '8- طرق التسمم عند الأطفال',
    answers: [
      'البلع عن طريق الفم',
      'اللمس عند طريق الجلد أو الاستنشاق بالأنف',
      'العين',
      'الأذن'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '9- ما هي أعراض وعلامات التسمم؟',
    answers: [
      'ارتفاع ضغط الدم',
      'دوخة، القيء، صعوبة التنفس، فقدان الوعي',
      'الارتباك أو تغير في الحالة العقلية',
      'زيادة التركيز والنشاط الذهني'
    ],
    correctAnswer: [1, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '10- ما هي مضاعفات التسمم؟',
    answers: [
      'خلل في توازن السوائل والأملاح داخل الجسم',
      'التشنجات أو تغير مستوى الوعي',
      'فرط النشاط',
      'زيادة الشهية'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '11- ما هي الإجراءات التي يجب القيام بها للطفل المشتبه بإصابته بالتسمم؟',
    answers: [
      'تحفيز القيء فوراً',
      'تقييم مجرى الهواء، معدل التنفس والدورة الدموية للطفل',
      'إعطاء الطفل الحليب لمعادلة السم',
      'فحص العلامات الحيوية'
    ],
    correctAnswer: [1, 3],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '12- ما الأسباب المحتملة للتسمم الغذائي والأدوية للأطفال؟',
    answers: [
      'تناول طعام ملوث بالبكتيريا أو الفيروسات أو الأطعمة غير المحفوظة بطريقة صحيحة',
      'تناول الطفل طعاماً بعد طهيه مباشرة',
      'ترك الأدوية في متناول الأطفال',
      'تناول الأدوية بالجرعات الموصى بها'
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '13- ما الأعراض الشائعة لتسمم الأدوية والأطعمة الفاسدة عند الأطفال؟',
    answers: [
      'اضطراب في مستوى الوعي أو غيبوبة',
      'سعال خفيف مستمر فقط',
      'قيء شديد أو إسهال وتنفس غير طبيعي',
      'نزيف من الأنف أو الفم'
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '14- ما هي “حبوب الغلة” ولماذا تُعتبر شديدة الخطورة؟',
    answers: [
      'مبيد حشري يستخدم في تخزين الغلال',
      ' تتحول في المعدة إلى غاز فوسفيد الهيدروجين السام',
      'دواء لعلاج أمراض المعدة',
      ' مكمل غذائي غني بالبروتين'
    ],
    correctAnswer: [0,1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '15- ما أعراض التسمم بحبوب الغلة عند الأطفال؟',
    answers: [
      'قيء شديد وهبوط في الضغط',
      'صعوبة في التنفس واضطراب في الوعي',
      'طفح جلدي فقط',
      'ارتفاع بسيط في الحرارة فقط'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '16- ما أعراض التسمم بالمواد الكاوية لدى الأطفال؟',
    answers: [
      'حروق بالفم أو الحلق',
      'صعوبة في البلع أو التنفس',
      'طفح جلدي فقط دون أعراض أخرى',
      'زيادة الشهية والنشاط'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '17- ما المخاطر الناجمة عن التسمم بالمواد الكاوية؟',
    answers: [
      'تمزق المريء أو النزيف الداخلي',
      'ضيق تنفسي شديد والتهاب في الشعب الهوائية',
      'احمرار بسيط في الجلد فقط',
      'ألم عضلي مؤقت'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '18- ما الأعراض الشائعة لتسمم الاستنشاق عند الأطفال؟',
    answers: [
      'صداع مفاجئ وضعف عام تدهور في مستوى الوعي أو غيبوبة',
      'دوار وصعوبة في التنفس و زرقة في الشفاه أو الأطراف',
      'طفح جلدي خفيف فقط',
      'زيادة النشاط الحركي فقط'
    ],
    correctAnswer: [0,1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '19- ما هي الإجراءات المتبعة لحالة تسمم استنشاق؟',
    answers: [
      'تأمين مجرى الهواء والتأكد من التنفس',
      'نقل الطفل إلى مكان جيد التهوية فوراً',
      'إعطاء الطفل طعام لتهدئته',
      'تجاهل الحالة إذا اختفى الدوار'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '20- ما الأعراض التي قد تشير لتسمم نتيجة لدغة حيوان أو حشرة سامة؟',
    answers: [
      'تورم شديد أو احمرار مكان اللدغة',
      'صعوبة في التنفس أو تغير في الوعي',
      'حكة خفيفة تختفي خلال دقائق',
      'عطس وسيلان الأنف فقط'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '21- ما المضاعفات التي قد تحدث نتيجة التسمم من اللدغات؟',
    answers: [
      'الوذمة التحسسية الحادة',
      'فشل في الجهاز التنفسي أو الدوري',
      'ارتفاع بسيط في الحرارة فقط',
      'نزيف في اللثة'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '22- ما مفهوم الاختناق عند الأطفال؟',
    answers: [
      'حالة طارئة تهدد حياة الطفل نتيجة عدم القدرة على التنفس بشكل طبيعي',
      'بلع جسم غريب داخل الجهاز الهضمي',
      'إدخال جسم غريب في قناة الأذن',
      'انسداد مجرى الهواء بواسطة جسم غريب'
    ],
    correctAnswer: [0, 3],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '23- ما أسباب الاختناق عند الأطفال؟',
    answers: [
      'قطع الطعام الكبيرة',
      'الألعاب غير الآمنة',
      'قلة نوم الطفل',
      'تأخر الطفل في تعلم الكلام'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '24- ما هي أنواع الاختناق عند الأطفال؟',
    answers: [
      'الاختناق الجزئي',
      'الاختناق الكامل',
      'الاختناق الداخلي',
      'الاختناق الخارجي'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '25- ما هي علامات الاختناق الجزئي؟',
    answers: [
      'الكحة القوية',
      'الكحة الضعيفة أو عدم القدرة على الكحة',
      'القدرة على التحدث',
      'عدم وجود صوت عند محاولة التنفس'
    ],
    correctAnswer: [0, 2],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '26- ما هي علامات الاختناق الكامل؟',
    answers: [
      'عدم خروج أي صوت عند محاولة التنفس أو صوت حاد',
      'زرقة الوجه والشفتين',
      'القدرة على الكحة بقوة',
      'احمرار الوجه أو احمراره الشديد'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '27- ما هي مضاعفات الاختناق؟',
    answers: [
      'الالتهاب الرئوي',
      'نقص الأكسجين وتلف الدماغ',
      'زيادة النشاط البدني',
      'زيادة سعة الرئة'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '28- الإجراءات التمريضي الفوري عند اختناق الأطفال في حالة عدم فقدان الوعي ؟',
    answers: [
      'إعطاء ثلاثة ضربات علي الظهر ',
      'تشجيع الطفل علي الكحة بقوة ',
      'إعطاء خمسة ضربات علي الظهر',
      'إعطاء ثلاثة ضغات بطنية'
    ],
    correctAnswer: [2,3],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),

  QuestionModel(
    question: '29- ما هي الإجراءات التمريضية الفورية عند اختناق الأطفال؟',
    answers: [
      'البدء بالإنعاش القلبي الرئوي إذا لزم الأمر',
      'فحص مجرى الهواء ومعدل التنفس والدورة الدموية',
      'إعطاء الطفل الماء لمحاولة إفاقته',
      'هز الطفل بقوة حتى يستعيد وعيه'
    ],
    correctAnswer: [0, 1],
    isMultiChoice: true,
    type: QuestionType.withPoints,
    point: 2.0,
      stage: 2
  ),
];
