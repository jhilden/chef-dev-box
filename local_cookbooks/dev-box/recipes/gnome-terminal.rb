# general settings
general_settings = {
  "new-terminal-mode" => "\\'tab\\'"
}

general_settings.each do |key, value|
  execute "dconf write /org/gnome/terminal/legacy/#{key} #{value}"
end

# keyboard shortcuts
key_bindings = {
  "find" => "\\'<Primary>f\\'",
  "find-next" => "\\'F3\\'",
  "new-tab" => "\\'<Primary>t\\'",
  "close-tab" => "\\'<Primary>w\\'",
  "close-window" => "\\'<Primary><Shift>w\\'",
  "reset-and-clear" => "\\'<Primary>BackSpace\\'",
}

# profile settings
profile_settings = {
  "use-transparent-background" => true,
  "background-transparency-percent" => 35,
  "default-size-columns" => 150,
  "default-size-rows" => 40
}

default_profile_id = `gsettings get org.gnome.Terminal.ProfilesList default`.strip.gsub("'", "")

if default_profile_id.size > 0
  profile_settings.each do |key, value|
    execute "dconf write /org/gnome/terminal/legacy/profiles:/:#{default_profile_id}/#{key} #{value}"
  end
end