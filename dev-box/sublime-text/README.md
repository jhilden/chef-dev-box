# sublime-text-cookbook

Cookbook for installing Sublime Text

## Supported Platforms

* Ubuntu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>node['sublime-text]['version']</td>
    <td>integer</td>
    <td>The version of Sublime Text to install. Currently supports versions 2 and 3</td>
    <td>2</td>
  </tr>
  <tr>
    <td>node['sublime-text']['platform']['release']</td>
    <td>string</td>
    <td>The release of ubuntu being installed to</td>
    <td>'trusty'</td>
  </tr>
  <tr>
    <td>node['sublime-text']['platform']['architecture']</td>
    <td>string</td>
    <td>The hardware architecture</td>
    <td>'amd64'</td>
  </tr>
</table>

## Usage

### sublime-text::default

Include `sublime-text` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[sublime-text::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Patrick Ayoup (patrick.ayoup@gmail.com)
