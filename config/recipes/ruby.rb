set_default :ruby_version, "1.9.3-p125"

namespace :ruby do
  desc "Install Ruby"
  task :install do
    run "#{sudo} apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev"
    run "wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-#{ruby_version}.tar.gz"
    run "tar -xvzf ruby-#{ruby_version}.tar.gz"
    run "cd ruby-#{ruby_version} && ./configure"
    run "cd ruby-#{ruby_version} && make"
    run "cd ruby-#{ruby_version} && #{sudo} make install"
    run "#{sudo} gem install bundler --no-ri --no-rdoc"
  end
end

