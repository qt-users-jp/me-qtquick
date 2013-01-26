import Silk.HTML 5.0
import 'bootstrap' as Bootstrap

Html {
    lang: 'ja'
    Head {
        Meta { charset: 'utf-8' }
        Title {
            text: 'qtquick.me'
        }
        Link { href: '/css/bootstrap.min.css'; rel: 'stylesheet'; media: 'screen' }
        Link { href: '/css/bootstrap-responsive.min.css'; rel: 'stylesheet'; media: 'screen' }
    }
    Body {
        style: 'overflow-y:scroll;padding-top:40px'
        Bootstrap.Container {
            Bootstrap.NavBar {
                _class: 'navbar-fixed-top'
                Div {
                    _class: 'navbar-inner'

                    A { href: '//qtquick.me'; _class: 'brand'; text: 'qtquick.me' }
                    Ul {
                        _class: 'nav'
                        Li { _class: 'active'; A { I { _class: 'icon-home'; text: '' } Text { text: 'Home' } } }
                        Li { A { href: '//git.qtquick.me'; text: 'Repositories' } }
                        Li { A { href: '//cr.qtquick.me'; text: 'Code Review' } }
                        Li { A { href: '//ci.qtquick.me'; text: 'Continuous Integration' } }
                        Li { A { href: '//dev.qtquick.me'; text: 'Project management' } }
                    }

                    Ul {
                        _class: 'nav pull-left'
                        Li {
                            _class: 'dropdown'
                            A {
                                href: '#'
                                _class: 'dropdown-toggle'
                                property string data_toggle: 'dropdown'
                                Text { text: 'Admins' }
                                Span { _class: 'caret' }
                            }
                            Ul {
                                _class: 'dropdown-menu'
                                Li {
                                    A {
                                        href: 'http://twitter.com/%1'.arg('task_jp')
                                        target: '_blank'
                                        Img { width: '22'; height: '22'; src: 'http://api.twitter.com/1/users/profile_image?screen_name=%1'.arg('task_jp') }
                                        Text { text: '@task_jp' }
                                    }
                                }
                                Li {
                                    A {
                                        href: 'http://twitter.com/%1'.arg('kenya888')
                                        target: '_blank'
                                        Img { width: '22'; height: '22'; src: 'http://api.twitter.com/1/users/profile_image?screen_name=%1'.arg('kenya888') }
                                        Text { text: '@kenya888' }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            H1 {
                text: 'Instructions'
            }

            Bootstrap.Tabbable {
                _class: 'tabs-left'
                Bootstrap.TabBar {

                    Bootstrap.Tab {
                        __pane: '#readonly'
                        text: 'Readonly access'
                    }
                    Bootstrap.Tab {
                        __pane: '#clone'
                        __active: true
                        text: 'Clone a repository'
                    }
                    Bootstrap.Tab {
                        __pane: '#commit'
                        text: 'Make change'
                    }
                    Bootstrap.Tab {
                        __pane: '#pull'
                        text: 'Update your clone'
                    }
                    Bootstrap.Tab {
                        __pane: '#amend'
                        text: 'Update your change in cr.qtquick.me'
                    }
                }

                Bootstrap.TabContent {
                    Bootstrap.TabPane {
                        _id: 'readonly'
                        Pre {
                            text: '$ git clone git://<a href="//git.qtquick.me/">git.qtquick.me</a>/<em><a href="//git.qtquick.me/">projectname</a></em>.git
$ cd <em>projectname</em>'
                        }
                        P {
                            _class: 'alert alert-info'
                            text: '<strong>Note:</strong> Fetch submodules if a project contains one or more submodules'
                        }
                        Pre {
                            text: '$ git submodule update --init'
                        }
                    }
                    Bootstrap.TabPane {
                        _id: 'clone'
                        __active: true
                        Ol {
                            Li {
                                text: 'Visit <a href="//cr.qtquick.me">cr.qtquick.me</a> and register an account with your OpenID.'
                                Ul {
                                    Li { text: 'set <em>username</em>' }
                                    Li { text: 'add one or more ssh keys (e.g. ~/.ssh/id_rsa.pub)' }
                                }
                            }
                            Li {
                                text: 'Setup ssh configuration'
                                Pre {
                                    text: '$ vi ~/.ssh/config
Host <a href="//cr.qtquick.me">cr.qtquick.me</a>
    Port 29418
    User <em>username</em>'
                                }
                            }
                            Li {
                                text: 'Test ssh connection'
                                Pre {
                                    text: '$ ssh cr.qtquick.me
  ****    Welcome to Gerrit Code Review    ****

  Hi <em>Your Name</em>, you have successfully connected over SSH.

  Unfortunately, interactive shells are disabled.
  To clone a hosted Git repository, use:

  git clone ssh://<em>username</em>@<a href="//cr.qtquick.me/">cr.qtquick.me</a>:29418/REPOSITORY_NAME.git

Connection to <a href="//cr.qtquick.me/">cr.qtquick.me</a> closed.'
                                }
                            }
                            Li {
                                text: 'Clone a project'
                                Pre {
                                    text: '$ git clone ssh://<a href="//cr.qtquick.me">cr.qtquick.me</a>/<em><a href="//git.qtquick.me/">projectname</a></em>.git
$ cd <em>projectname</em>'
                                }
                                P {
                                    _class: 'alert alert-info'
                                    text: '<strong>Note:</strong> Fetch submodules if a project contains one or more submodules'
                                }
                                Pre {
                                    text: '$ git submodule update --init'
                                }
                            }
                            Li {
                                text: 'Setup your repogitory'
                                Pre {
                                    text: '$ scp <a href="//cr.qtquick.me">cr.qtquick.me</a>:/hooks/commit-msg .git/hooks/
$ git config remote.origin.push HEAD:refs/for/master'
                                }
                            }
                        }
                    }
                    Bootstrap.TabPane {
                        _id: 'commit'
                        Ol {
                            Li { text: 'Fix a bug or implement a new feature' }
                            Li {
                                text: 'Commit your change'
                                Pre {
                                    text: '$ git status
$ git add <em>files</em>
$ git commit'
                                }
                                P {
                                    _class: 'alert alert-info'
                                    text: '<strong>Note</strong> &quot;<em>Issue-Id: #nnn</em>&quot; to be added to commit message manually if your change has an issue number in <a href="//dev.qtquick.me/">dev.qtquick.me</a>'
                                }
                                Pre {
                                    text: '$git show'
                                }
                                P {
                                    _class: 'alert'
                                    text: '<strong>Important</strong> make sure your commit contains &quot;<em>Change-Id: I000000000000000...</em>&quot; which is automatically added'
                                }
                            }
                            Li {
                                text: 'Push your commit to code review'
                                Pre {
                                    text: '$ git push
Counting objects: <em>nn</em>, done.
Delta compression using up to <em>nn</em> threads.
Compressing objects: 100% (<em>nn</em>/<em>nn</em>), done.
Writing objects: 100% (<em>nn</em>/<em>nn</em>), <em>nn.nn</em> KiB, done.
Total <em>nn</em> (delta <em>nn</em>), reused <em>nn</em> (delta <em>nn</em>)
remote: Resolving deltas: 100% (<em>nn</em>/<em>nn</em>)
remote: Processing changes: new: <em>nn</em>, done
remote:
remote: New Changes:
remote:   http://<a href="//cr.qtquick.me/">cr.qtquick.me</a>/<em>nn</em>
remote:
To ssh://<a href="//cr.qtquick.me/">cr.qtquick.me</a>/<em>projectname</em>.git
 * [new branch]      HEAD -> refs/for/master                             '
                                }
                            }
                            Li {
                                text: 'add one or more reviewer(s) (e.g. "Tasuku Suzuki")'
                                P {
                                    _class: 'alert alert-info'
                                    text: '<strong>Tips</strong> reviewer can be added like below'
                                }
                                Pre {
                                    text: '$ git config remote.origin.receivepack "git receive-pack --reviewer=stasuku@gmail.com"'
                                }
                            }

                        }
                    }
                    Bootstrap.TabPane {
                        _id: 'pull'
                        Ol {
                            Li {
                                text: 'make sure your repository is clean'
                                Pre {
                                    text: '$ git reset HEAD .
$ git checkout .
($ git clean -xdf)'
                                }
                                P {
                                    _class: 'alert alert-info'
                                    text: '<strong>Note</strong> or stash changes'
                                }
                                Pre {
                                    text: '$ git stash'
                                }
                            }
                            Li {
                                text: 'update'
                                Pre {
                                    text: '$ git pull --rebase'
                                }
                            }
                        }
                    }
                    Bootstrap.TabPane {
                        _id: 'amend'
                        Ol {
                            Li { text: 'Update your code' }
                            Li {
                                text: 'override a commit'
                                Pre {
                                    text: '$ git add <em>files</em>
$ git commit --amend
$ git push'
                                }
                            }
                        }
                    }
                }
            }
        }

        Script { src: 'http://code.jquery.com/jquery-latest.js' }
        Script { src: '/js/bootstrap.min.js' }
        Script {
            text: "$('.nav-tabs a').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
})"
        }
    }
}
