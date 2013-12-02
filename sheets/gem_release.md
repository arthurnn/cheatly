# RubyGems release

    $ gem release your.gemspec              # builds the gem and pushes it to
                                            # rubygems.org
    $ gem release                           # uses the first *.gemspec in the
                                            # current working directory
    $ gem release --tag                     # also executes gem tag
    $ gem release --key KEY                 # use the specified API key from
                                            # ~/.gem/credentials
    $ gem release --host HOST               # push to a gemcutter-compatible host
                                            # other than rubygems.org
    $ gem release --quiet                   # suppress output status messages
    $ gem tag                               # creates a git tag and pushes to
                                            # the origin git repository
    $ gem gemspec                           # generates a [gem_name].gemspec using
                                            # Dir[\"{lib/**/*,[A-Z]*}\"]
    $ gem gemspec --strategy git            # uses s.files = `git ls-files app
                                            # lib`.split("\\")
    $ gem bootstrap                         # generates a [gem_name].gemspec using
                                            # the current directory name
                                            # and scaffolds
                                            # lib/[gem_name]/version.rb, README,
                                            # test/
    $ gem bootstrap your_gem                # creates a your_gem directory,
                                            # bootstraps your_gem and inits a git
                                            # repo
    $ gem bootstrap --github                # inits a git repo, creates it on
                                            # GitHub and pushes it to github
                                            # (requires git config for
                                            # github.user and github.token
                                            # to be set)
    $ gem bump                        # Bump the gem version to the next patch or
                                      # pre-release level (e.g. 0.0.1 to 0.0.2,
                                      # 1.0.0.pre1 to 1.0.0.pre2, 1.0.0.rc1 to
                                      # 1.0.0.rc2)
    $ gem bump --version 1.1.1        # Bump the gem version to the given version
                                      # number
    $ gem bump --version major        # Bump the gem version to the next major
                                      # level (e.g. 0.0.1 to 1.0.0)
    $ gem bump --version minor        # Bump the gem version to the next minor
                                      # level (e.g. 0.0.1 to 0.1.0)
    $ gem bump --version patch        # Bump the gem version to the next patch
                                      # level (e.g. 0.0.1 to 0.0.2)
    $ gem bump --version pre|rc|etc   # Bump the gem version to the next
                                      # pre-release level (e.g. `pre`: 1.0.0.pre1
                                      # to 1.0.0.pre2, 0.0.1 to 0.0.2.pre1;
                                      # `beta`: 1.0.0.beta1 to 1.0.0.beta2, 0.0.1
                                      # to 0.0.2.beta1)
    $ gem bump --push                 # Bump and push to the origin git  repository
    $ gem bump --tag                  # Bump and tag gem and pushes tags to the
                                      # origin repository
    $ gem bump --release              # Bump and release gem
    $ gem bump --release --key KEY    # Bump and release the gem, using the
                                      # specified API key from ~/.gem/credentials
    $ gem bump --release --host HOST  # Bump and release the gem to a
                                      # gemcutter-compatible host other than
                                      # rubygems.org
    $ gem bump --release --quiet      # Bump and release the gem, suppressing
                                      # output status messages
    $ gem bump --tag --release        # Bump, tag, push and release gem
    $ gem bump --no-commit            # Bump the gem version but don't git commit
                                      # (will be ignored if combined with push,
                                      # tag or release)
