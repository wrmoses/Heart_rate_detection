figure
h_menu=uimenu(gcf,'label','color');%%�û�����˵���color
h_submenul=uimenu(h_menu,'label','blue','callback','set(gcf,''color'',''blue'')');%���������˵���blue
h_submenu2=uimenu(h_menu,'label','red','callback','set(gcf,''color'',''red'')');%���������˵���red