stager Cookbook
===============

Installs and configures [https://github.com/localytics/stager-server](stager).

Requirements
------------

#### cookbooks
- `apt` - keep the repos up to date with the apt cookbook
- `build-essential` - we need build utils
- `docker` - to run containers
- `nginx` - used as a reverse proxy
- `runit` - process supervision

Attributes
----------

#### stager::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['stager']['user']</tt></td>
    <td>String</td>
    <td>what user to run stager as</td>
    <td><tt>docker</tt></td>
  </tr>
  <tr>
    <td><tt>['stager']['hostname']</tt></td>
    <td>String</td>
    <td>hostname for nginx to respond to</td>
    <td><tt>stager.test.com</tt></td>
  </tr>
  <tr>
    <td><tt>['stager']['packages']</tt></td>
    <td>Array</td>
    <td>array of packages to install</td>
    <td><tt>ruby1.9.1-dev, bundler, git</tt></td>
  </tr>
  <tr>
    <td><tt>['stager']['path']['install']</tt></td>
    <td>string</td>
    <td>path to install stager to</td>
    <td><tt>/opt/stager</tt></td>
  </tr>
  <tr>
    <td><tt>['stager']['repo']</tt></td>
    <td>string</td>
    <td>url to repo</td>
    <td><tt>https://github.com/localytics/stager-server</tt></td>
  </tr>
  <tr>
    <td><tt>['stager']['branch']</tt></td>
    <td>string</td>
    <td>which branch of code to pull</td>
    <td><tt>master</tt></td>
  </tr>
</table>

Usage
-----
#### stager::default
Installs all required packages(runit, docker, nginx) and installs the stager application into /opt/stager.

Just include `stager` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[stager]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Adam Enger - adamenger@gmail.com
