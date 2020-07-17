require 'csv'
require 'erb'
require 'open-uri'

URL = 'https://docs.google.com/spreadsheets/....&output=csv'

TEMPLATE = <<ERB
% Mother's Day Scavenger Hunt
% May 10, 2020

# A Single-Elimination Tournament

In each game, two players face off.  They will both be given the same prompt
for something they must each find in their surroundings.

- Example: "something fuzzy"

# Time is of the Essence!

Both players have one minute to find an item that exemplifies the prompt and
either bring it to the camera or bring the camera to the item.

# Majority Rule

When both players have found something, they will each have a chance to
present it and explain their rationale.  Everyone else will then vote to
determine who has won the round and will advance in the bracket.

------------------

# Ready?

<% prompts.each do |prompt| %>
------------------

<%= prompt %>
<% end %>
ERB


rows = CSV.parse(open(URL).read).reject{|r| r.first.nil?}
prompts = rows.map(&:last).shuffle
STDERR.puts "Rendering presentation for #{prompts.count} prompts"
template = ERB.new(TEMPLATE)

# p prompts.count
puts template.result(binding)
