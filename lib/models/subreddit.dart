class SubredditModel {
  final String subredditName, community;
  final int numberOfMembers;

  SubredditModel(this.subredditName, this.community, this.numberOfMembers);
  
}

List<SubredditModel> subredditsModel = [
  SubredditModel('ChaseAfterYourDreams', 'Community', 19504),
  SubredditModel('FlutterDev', 'Flutter', 667),
  SubredditModel('HtmlDev', 'HTML', 0),
  SubredditModel('CssDev', 'CSS', 0),
  SubredditModel('JsDev', 'JavaScript', 1),
  SubredditModel('JavaDev', 'Java', 19504),
  SubredditModel('TsDev', 'TypeScript', 1000),
  SubredditModel('PhpDev', 'PHP', 100),
  SubredditModel('ReactDev', 'React', 19505),
  SubredditModel('CppDev', 'C++', 19500),
  SubredditModel('C#Dev', 'C#', 19501),
];