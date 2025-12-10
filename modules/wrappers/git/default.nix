{inputs,pkgs,... }: {
  environment.systemPackages = [
    (inputs.wrapperModules.git.apply {
      inherit pkgs;
      env = rec {
	GIT_AUTHOR_NAME = "desiirenav";
	GIT_AUTHOR_EMAIL = "desiirenav@gmail.com";
	GIT_COMMITTER_NAME = GIT_AUTHOR_NAME;
	GIT_COMMITTER_EMAIL = GIT_AUTHOR_EMAIL;
      };
    }).wrapper
  ];
}
