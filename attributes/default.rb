# run stager as docker user
default['stager']['user'] = "docker"
default['stager']['group'] = "docker"

# hostname to set up stager at
default['stager']['hostname'] = "stager.test.com"

# packages needed by stager
default['stager']['packages'] = ['ruby1.9.1-dev', 'bundler', 'git']

# path to clone stager code to
default['stager']['path']['install'] = "/opt/stager"

# url to repo and branch to pull 
default['stager']['repo'] = "https://github.com/localytics/stager-server"
default['stager']['branch'] = "master"
