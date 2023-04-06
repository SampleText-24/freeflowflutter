import 'models.dart';

final User user_0 = User(
  name: const Name(first: 'Sample', last: 'Text'),
  avatarUrl: 'assets/avatar_1.png',
  lastActive: DateTime.now(),
);

final User user_1 = User(
  name: const Name(first: 'Giga', last: 'Chad'),
  avatarUrl: 'assets/avatar_2.png',
  lastActive: DateTime.now().subtract(const Duration(minutes: 10)),
);

final User user_2 = User(
  name: const Name(first: 'Semen', last: 'Swallow'),
  avatarUrl: 'assets/avatar_3.png',
  lastActive: DateTime.now().subtract(const Duration(minutes: 20)),
);

final User user_3 = User(
  name: const Name(first: 'Dick', last: 'Moby'),
  avatarUrl: 'assets/avatar_4.png',
  lastActive: DateTime.now().subtract(const Duration(hours: 2)),
);

final User user_4 = User(
  name: const Name(first: 'Three', last: 'Watermelon'),
  avatarUrl: 'assets/avatar_5.png',
  lastActive: DateTime.now().subtract(const Duration(hours: 6)),
);

final List<Email> emails = [
  Email(
      sender: user_1,
      recipients: [],
      subject: 'Вата хээээл',
      content:
          'Sorry to the guys I had to hide, Sorry to the girls I had to lie to'),
  Email(
      sender: user_2,
      recipients: [],
      subject: 'Spineless',
      content:
          'I feel like I\'m hanging by my throat, I wanna cut the rope but I just don\'t know how to cope'),
  Email(
      sender: user_3,
      recipients: [],
      subject: 'Volunteer EMT with me?',
      content:
          'What do you think about training to be volunteer EMTs? We could do it together for moral support. Think about it??',
      attachments: [const Attachment(url: 'assets/thumbnail_1.png')]),
  Email(
      sender: user_4,
      recipients: [],
      subject: 'Dinner Club',
      content:
      "I think it's time for us to finally try that new noodle shop downtown that doesn't use menus. Anyone else have other suggestions for dinner club this week? I'm so intrigued by this idea of a noodle restaurant where no one gets to order for themselves - could be fun, or terrible, or both :)\n\nSo"),
];
