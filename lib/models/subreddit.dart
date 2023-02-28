class Subreddit {
  final String subredditName, community;
  final int numberOfMembers;

  Subreddit(this.subredditName, this.community, this.numberOfMembers);
  
}

List<Subreddit> subreddits = [
  Subreddit('r/ChaseAfterYourDreams', 'Community', 19504),
  Subreddit('r/FlutterDev', 'Flutter', 667),
  Subreddit('r/HtmlDev', 'HTML', 0),
  Subreddit('r/CssDev', 'CSS', 0),
  Subreddit('r/JsDev', 'JavaScript', 1),
  Subreddit('r/JavaDev', 'Java', 19504),
  Subreddit('r/TsDev', 'TypeScript', 1000),
  Subreddit('r/PhpDev', 'PHP', 100),
  Subreddit('r/ReactDev', 'React', 19505),
  Subreddit('r/CppDev', 'C++', 19500),
  Subreddit('r/C#Dev', 'C#', 19501),
];