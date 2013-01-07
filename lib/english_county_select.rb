# english_county_select
module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using english_county_options_for_select to generate the list of option tags.
      def english_county_select(object, method, priority_counties = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_english_county_select_tag(priority_counties, options, html_options)
      end
      # Returns a string of option tags for pretty much any english_county in the world. Supply a english_county name as +selected+ to
      # have it marked as the selected option tag. You can also supply an array of countries as +priority_counties+, so
      # that they will be listed above the rest of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
      def english_county_options_for_select(selected = nil, priority_counties = nil)
        english_county_options = ""

        if priority_counties
          english_county_options += options_for_select(priority_counties, selected)
          english_county_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
          selected=nil if priority_counties.include?(selected)
        end

        return (english_county_options + grouped_options_for_select(COUNTIES, selected)).html_safe
      end
      # All the countries included in the english_county_options output.
      COUNTIES = [ ["England", ["Avon", "Bedfordshire", "Berkshire", "Buckinghamshire", "Cambridgeshire", "Cheshire", "Cleveland", "Cornwall", "Cumbria", "Derbyshire", "Devon", "Dorset", "Durham", "East Sussex", "Essex", "Gloucestershire", "Hampshire", "Herefordshire", "Hertfordshire", "Isle of Wight", "Kent", "Lancashire", "Leicestershire", "Lincolnshire", "London", "Merseyside", "Middlesex", "Norfolk", "Northamptonshire", "Northumberland", "North Humberside", "North Yorkshire", "Nottinghamshire", "Oxfordshire", "Rutland", "Shropshire", "Somerset", "South Humberside", "South Yorkshire", "Staffordshire", "Suffolk", "Surrey", "Tyne and Wear", "Warwickshire", "West Midlands", "West Sussex", "West Yorkshire", "Wiltshire", "Worcestershire"]], ["Wales", ["Clwyd", "Dyfed", "Gwent", "Gwynedd", "Mid Glamorgan", "Powys", "South Glamorgan", "West Glamorgan"] ], ["Scotland", ["Aberdeenshire", "Angus", "Argyll", "Ayrshire", "Banffshire", "Berwickshire", "Bute", "Caithness", "Clackmannanshire", "Dumfriesshire", "Dunbartonshire", "East Lothian", "Fife", "Inverness-shire", "Kincardineshire", "Kinross-shire", "Kirkcudbrightshire", "Lanarkshire", "Midlothian", "Moray", "Nairnshire", "Orkney", "Peeblesshire", "Perthshire", "Renfrewshire", "Ross-shire", "Roxburghshire", "Selkirkshire", "Shetland", "Stirlingshire", "Sutherland", "West Lothian", "Wigtownshire"] ], ["Northern Ireland", ["Antrim", "Armagh", "Down", "Fermanagh", "Londonderry", "Tyrone"] ] ] unless const_defined?("COUNTIES")
    end
    
    class InstanceTag
      def to_english_county_select_tag(priority_counties, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            english_county_options_for_select(value, priority_counties),
            options, value
          ), html_options
        )
      end
    end
    
    class FormBuilder
      def english_county_select(method, priority_counties = nil, options = {}, html_options = {})
        @template.english_county_select(@object_name, method, priority_counties, options.merge(:object => @object), html_options)
      end
    end
  end
end