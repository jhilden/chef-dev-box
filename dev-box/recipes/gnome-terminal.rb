# general settings
general_settings = {
  "new-terminal-mode" => "\\'tab\\'"
}

general_settings.each do |key, value|
  execute "dconf write /org/gnome/terminal/legacy/#{key} #{value}"
end

# keyboard shortcuts
key_bindings = {
  "find" => "<Primary>f",
  "find-next" => "F3",
  "new-tab" => "<Primary>t",
  "close-tab" => "<Primary>w",
  "close-window" => "<Primary><Shift>w",
  "reset-and-clear" => "<Primary>BackSpace",
}

key_bindings.each do |key, value|
  execute "dconf write /org/gnome/terminal/legacy/keybindings/#{key} \"'#{value}'\""
end

# profile settings
profile_settings = {
  "default-size-columns" => 150,
  "default-size-rows" => 40,
  "login-shell" => true
}

default_profile_id = `gsettings get org.gnome.Terminal.ProfilesList default`.strip.gsub("'", "")

if default_profile_id.size > 0
  profile_settings.each do |key, value|
    execute "dconf write /org/gnome/terminal/legacy/profiles:/:#{default_profile_id}/#{key} #{value}"
  end
end

# styling (e.g. tab color)
cookbook_file 'gtk.css' do
  path "/home/#{node['dev-box']['user']}/.config/gtk-3.0/gtk.css"
  user node['dev-box']['user']
  source 'gtk.css'
end
