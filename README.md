# Crm Daron [![Code Climate](https://codeclimate.com/github/mvoto/crm-daron/badges/gpa.svg)](https://codeclimate.com/github/mvoto/crm-daron)

This is a specific crm project.

### Rspec
* There is a sample .rspec file in .rspec.example, you should copy it to
.rspec if you don't have one yet.
* To use capybara power on acceptance tests, check out this [cheat sheet](https://gist.github.com/zhengjia/428105)

## Tips
* On acceptance/features tests, you can use `save_and_open_page` to open the current
tested page on your browser. This gem does the trick: [launchy](https://github.com/copiousfreetime/launchy)
* After creating models, run:
`annotate --exclude tests,fixtures,factories -p after`
* Always keep seeds file updated when adding new ActiveRecord models
* Use rails c --sandbox to use console and not save any register(rollback on exit)

#### TODO

VERSION 1:
- Add Device's model
- Add Device's brand
- Add Device's battery
- Add Device's serial number
- Add Device's value
- Add Device's warranty

VERSION 2:
- Add an export button on customers to generate a .xls file
- Add customer's details print version with button / link
