figure
h_menu=uimenu(gcf,'label','color');%%用户顶层菜单项color
h_submenul=uimenu(h_menu,'label','blue','callback','set(gcf,''color'',''blue'')');%制作下拉菜单项blue
h_submenu2=uimenu(h_menu,'label','red','callback','set(gcf,''color'',''red'')');%制作下拉菜单项red