execute "disable ubuntu remote product search" do
  command "gsettings set com.canonical.Unity.Lenses remote-content-search \\'none\\'"
end

execute "disable ubuntu remote product search" do
  command "gsettings set org.gnome.desktop.session idle-delay 600" # 600 = 10 minutes * 60 seconds
end

execute "enable 2x4 workspaces" do
  command "gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 4 && gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2"
end
