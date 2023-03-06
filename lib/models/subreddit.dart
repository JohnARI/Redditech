class SubredditModel {
  final String subredditName, subredditDescription, community;
  final int numberOfMembers;

  SubredditModel(this.subredditName, this.subredditDescription, this.community,
      this.numberOfMembers);
}

const lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam ante, eget aliquam nunc nisl sit amet nisl. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam ante, eget aliquam nunc nisl sit amet nisl.";

List<SubredditModel> subredditsModel = [
  SubredditModel(
      'ChaseAfterYourDreams',
      lorem,
      'ChaseAfterYourDreams',
      1000),
  SubredditModel('FlutterDev', lorem, 'Flutter', 667),
  SubredditModel('HtmlDev', lorem, 'HTML', 0),
  SubredditModel('CssDev', lorem, 'CSS', 0),
  SubredditModel('JsDev', lorem, 'JavaScript', 1),
  SubredditModel('JavaDev', lorem, 'Java', 19504),
  SubredditModel('TsDev', lorem, 'TypeScript', 1000),
  SubredditModel('PhpDev', lorem, 'PHP', 100),
  SubredditModel('ReactDev', lorem, 'React', 19505),
  SubredditModel('CppDev', lorem, 'C++', 19500),
  SubredditModel('C#Dev', lorem, 'C#', 19501),
];
