#SingleInstance,Force ;~�����滻��ʵ��
F12::
	Run,regsvr32 dm.dll	;~ /s����
	return
F1::	;~ ��ͼ
	dm:=ComObjCreate("dm.dmsoft")	;~ ���ô�Į
	;~ MsgBox,% dm.Ver()
	dmSetPath:=dm.GetBasePath()		;~ dm.dll·��
	dm_ret:=dm.SetPath(dmSetPath)	;~ ����Ĭ��·��
	hwnd:=dm.GetForegroundWindow()	;~ �󶨴��ھ��
	;~ hwnd:=dm.GetMousePointWindow()
	;~ ���ú�̨����ģʽ
	dm_ret:=dm.BindWindow(hwnd,"dx2","normal","windows",0)
	;~ dm_ret:=dm.BindWindow(hwnd,"gdi","normal","normal",0)
	;~ dm_ret:=dm.BindWindow(hwnd, "dx2", "windows3", "windows", 0)
	If dm_ret=0
		MsgBox,"��ʧ��"
	SetTimer,t,800
return

F2::	;~ ��ͼ
	dm := ComObjCreate("dm.dmsoft")
	dm_ret := dm.SetPath("z:")
	hwnd := dm.GetMousePointWindow()
	dm_ret := dm.BindWindow(hwnd,"normal","normal","windows",0)
	dm_ret := dm.Capture(0,0,1366,768,"screen.bmp")
	dm_ret := dm.UnBindWindow()
	return

t:
	dm_ret:=dm.FindPic(0,0,1366,768,"z.bmp","000000",0.8,0,intx,inty)	;~ ��ͼ
	;~ MouseMove, %intx%, %inty%	;~ �ƶ���ͼƬ����
	ToolTip,% dm_ret
return
