# English County Select Tag
=============

Helper for Rails to list all English counties in a select tag.
Pretty much a modified copy of the country_select gem for rails.
URL: https://github.com/rails/country_select

## Installation

Install as a gem using

    gem install english_county_select

Or put the following in your Gemfile

    gem 'english_county_select'

## Example

Simple use supplying model and attribute as parameters:

    english_county_select("user", "county_name")

    or

    form_for @user do |f|
        f.english_county_select :county_name
    end


## References
==============
  http://www.carronmedia.com/uk-postal-counties-list/
  http://en.wikipedia.org/wiki/List_of_counties_of_the_United_Kingdom


Copyright (c) 2013 Przemyslaw Bobak (Twitter: @bobek_balinek), under the MIT license.