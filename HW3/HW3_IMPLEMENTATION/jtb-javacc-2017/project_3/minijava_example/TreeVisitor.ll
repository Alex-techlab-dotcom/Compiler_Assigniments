




@.TV_vtable=global[1 x i8*] [
	i8 * bitcast(i32(i8 *) * @TV.Start to i8 *)
]
@.Tree_vtable=global[21 x i8*] [
	i8 * bitcast(i1(i8 *, i32) * @Tree.Init to i8 *),
	i8 * bitcast(i1(i8 *, i8 *) * @Tree.SetRight to i8 *),
	i8 * bitcast(i1(i8 *, i8 *) * @Tree.SetLeft to i8 *),
	i8 * bitcast(i8 *(i8 *) * @Tree.GetRight to i8 *),
	i8 * bitcast(i8 *(i8 *) * @Tree.GetLeft to i8 *),
	i8 * bitcast(i32(i8 *) * @Tree.GetKey to i8 *),
	i8 * bitcast(i1(i8 *, i32) * @Tree.SetKey to i8 *),
	i8 * bitcast(i1(i8 *) * @Tree.GetHas_Right to i8 *),
	i8 * bitcast(i1(i8 *) * @Tree.GetHas_Left to i8 *),
	i8 * bitcast(i1(i8 *, i1) * @Tree.SetHas_Left to i8 *),
	i8 * bitcast(i1(i8 *, i1) * @Tree.SetHas_Right to i8 *),
	i8 * bitcast(i1(i8 *, i32, i32) * @Tree.Compare to i8 *),
	i8 * bitcast(i1(i8 *, i32) * @Tree.Insert to i8 *),
	i8 * bitcast(i1(i8 *, i32) * @Tree.Delete to i8 *),
	i8 * bitcast(i1(i8 *, i8 *, i8 *) * @Tree.Remove to i8 *),
	i8 * bitcast(i1(i8 *, i8 *, i8 *) * @Tree.RemoveRight to i8 *),
	i8 * bitcast(i1(i8 *, i8 *, i8 *) * @Tree.RemoveLeft to i8 *),
	i8 * bitcast(i32(i8 *, i32) * @Tree.Search to i8 *),
	i8 * bitcast(i1(i8 *) * @Tree.Print to i8 *),
	i8 * bitcast(i1(i8 *, i8 *) * @Tree.RecPrint to i8 *),
	i8 * bitcast(i32(i8 *, i8 *) * @Tree.accept to i8 *)
]
@.Visitor_vtable=global[1 x i8*] [
	i8 * bitcast(i32(i8 *, i8 *) * @Visitor.visit to i8 *)
]
@.MyVisitor_vtable=global[1 x i8*] [
	i8 * bitcast(i32(i8 *, i8 *) * @MyVisitor.visit to i8 *)
]
@.TreeVisitor_vtable=global[0 x i8*] []
declare i8* @calloc(i32, i32)
declare i32 @printf(i8*, ...)
declare void @exit(i32)

@_cint = constant [4 x i8] c"%d\0a\00"
@_cOOB = constant [15 x i8] c"Out of bounds\0a\00"
@_cNSZ = constant [15 x i8] c"Negative size\0a\00"

define void @print_int(i32 %i) {
    %_str = bitcast [4 x i8]* @_cint to i8*
    call i32 (i8*, ...) @printf(i8* %_str, i32 %i)
    ret void
}

define void @throw_oob() {
    %_str = bitcast [15 x i8]* @_cOOB to i8*
    call i32 (i8*, ...) @printf(i8* %_str)
    call void @exit(i32 1)
    ret void
}

define void @throw_nsz() {
    %_str = bitcast [15 x i8]* @_cNSZ to i8*
    call i32 (i8*, ...) @printf(i8* %_str)
    call void @exit(i32 1)
    ret void
}
define i32 @main() {
    ;code snipet for printing
    %_0 = call i8* @calloc(i32 1, i32 8)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [1 x i8*], [1 x i8*]* @.TV_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_3 = bitcast i8* %_0 to i8***
    %_4 = load i8**, i8*** %_3
    %_5 = getelementptr i8*, i8** %_4, i32 0
    %_6 = load i8*, i8** %_5
    %_7 = bitcast i8* %_6 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_8 = call i32 %_7(i8* %_0)

    call void (i32) @print_int(i32 %_8)
    ret i32 0
}
define i32 @TV.Start(i8* %this){
    %ntb = alloca i1
    %nti = alloca i32
    %root = alloca i8*
    %v = alloca i8*
    ; code snipet for assignment Statemnt
    %_0 = call i8* @calloc(i32 1, i32 38)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [21 x i8*], [21 x i8*]* @.Tree_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_0, i8 ** %root


    ; code snipet for assignment Statemnt
  ;primary: root
    %_3 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_4 = bitcast i8* %_3 to i8***
    %_5 = load i8**, i8*** %_4
    %_6 = getelementptr i8*, i8** %_5, i32 0
    %_7 = load i8*, i8** %_6
    %_8 = bitcast i8* %_7 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 16
;---IN PRIMARY EXPRESSION END 1850---


    %_9 = call i1 %_8(i8* %_3 , i32 16)

    store i1 %_9, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: root
    %_10 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_11 = bitcast i8* %_10 to i8***
    %_12 = load i8**, i8*** %_11
    %_13 = getelementptr i8*, i8** %_12, i32 18
    %_14 = load i8*, i8** %_13
    %_15 = bitcast i8* %_14 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_16 = call i1 %_15(i8* %_10)

    store i1 %_16, i1* %ntb


    ;code snipet for printing
  ;primary: 100000000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 100000000)
    ; code snipet for assignment Statemnt
  ;primary: root
    %_17 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_18 = bitcast i8* %_17 to i8***
    %_19 = load i8**, i8*** %_18
    %_20 = getelementptr i8*, i8** %_19, i32 12
    %_21 = load i8*, i8** %_20
    %_22 = bitcast i8* %_21 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 8
;---IN PRIMARY EXPRESSION END 1850---


    %_23 = call i1 %_22(i8* %_17 , i32 8)

    store i1 %_23, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: root
    %_24 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_25 = bitcast i8* %_24 to i8***
    %_26 = load i8**, i8*** %_25
    %_27 = getelementptr i8*, i8** %_26, i32 12
    %_28 = load i8*, i8** %_27
    %_29 = bitcast i8* %_28 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 24
;---IN PRIMARY EXPRESSION END 1850---


    %_30 = call i1 %_29(i8* %_24 , i32 24)

    store i1 %_30, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: root
    %_31 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_32 = bitcast i8* %_31 to i8***
    %_33 = load i8**, i8*** %_32
    %_34 = getelementptr i8*, i8** %_33, i32 12
    %_35 = load i8*, i8** %_34
    %_36 = bitcast i8* %_35 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 4
;---IN PRIMARY EXPRESSION END 1850---


    %_37 = call i1 %_36(i8* %_31 , i32 4)

    store i1 %_37, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: root
    %_38 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_39 = bitcast i8* %_38 to i8***
    %_40 = load i8**, i8*** %_39
    %_41 = getelementptr i8*, i8** %_40, i32 12
    %_42 = load i8*, i8** %_41
    %_43 = bitcast i8* %_42 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 12
;---IN PRIMARY EXPRESSION END 1850---


    %_44 = call i1 %_43(i8* %_38 , i32 12)

    store i1 %_44, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: root
    %_45 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_46 = bitcast i8* %_45 to i8***
    %_47 = load i8**, i8*** %_46
    %_48 = getelementptr i8*, i8** %_47, i32 12
    %_49 = load i8*, i8** %_48
    %_50 = bitcast i8* %_49 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 20
;---IN PRIMARY EXPRESSION END 1850---


    %_51 = call i1 %_50(i8* %_45 , i32 20)

    store i1 %_51, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: root
    %_52 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_53 = bitcast i8* %_52 to i8***
    %_54 = load i8**, i8*** %_53
    %_55 = getelementptr i8*, i8** %_54, i32 12
    %_56 = load i8*, i8** %_55
    %_57 = bitcast i8* %_56 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 28
;---IN PRIMARY EXPRESSION END 1850---


    %_58 = call i1 %_57(i8* %_52 , i32 28)

    store i1 %_58, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: root
    %_59 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_60 = bitcast i8* %_59 to i8***
    %_61 = load i8**, i8*** %_60
    %_62 = getelementptr i8*, i8** %_61, i32 12
    %_63 = load i8*, i8** %_62
    %_64 = bitcast i8* %_63 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 14
;---IN PRIMARY EXPRESSION END 1850---


    %_65 = call i1 %_64(i8* %_59 , i32 14)

    store i1 %_65, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: root
    %_66 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_67 = bitcast i8* %_66 to i8***
    %_68 = load i8**, i8*** %_67
    %_69 = getelementptr i8*, i8** %_68, i32 18
    %_70 = load i8*, i8** %_69
    %_71 = bitcast i8* %_70 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_72 = call i1 %_71(i8* %_66)

    store i1 %_72, i1* %ntb


    ;code snipet for printing
  ;primary: 100000000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 100000000)
    ; code snipet for assignment Statemnt
    %_73 = call i8* @calloc(i32 1, i32 24)
    %_74 = bitcast i8* %_73 to i8***
    %_75 = getelementptr [1 x i8*], [1 x i8*]* @.MyVisitor_vtable, i32 0, i32 0
    store i8** %_75, i8*** %_74


  ;primary: %_73
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_73, i8 ** %v


    ;code snipet for printing
  ;primary: 50000000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 50000000)
    ; code snipet for assignment Statemnt
  ;primary: root
    %_76 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_77 = bitcast i8* %_76 to i8***
    %_78 = load i8**, i8*** %_77
    %_79 = getelementptr i8*, i8** %_78, i32 20
    %_80 = load i8*, i8** %_79
    %_81 = bitcast i8* %_80 to i32 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: v
    %_82 = load i8*, i8** %v
;---IN PRIMARY EXPRESSION END 1846---


    %_83 = call i32 %_81(i8* %_76 , i8* %_82)

    store i32 %_83, i32* %nti


    ;code snipet for printing
  ;primary: 100000000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 100000000)
    ;code snipet for printing
  ;primary: root
    %_84 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_85 = bitcast i8* %_84 to i8***
    %_86 = load i8**, i8*** %_85
    %_87 = getelementptr i8*, i8** %_86, i32 17
    %_88 = load i8*, i8** %_87
    %_89 = bitcast i8* %_88 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 24
;---IN PRIMARY EXPRESSION END 1850---


    %_90 = call i32 %_89(i8* %_84 , i32 24)

    call void (i32) @print_int(i32 %_90)
    ;code snipet for printing
  ;primary: root
    %_91 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_92 = bitcast i8* %_91 to i8***
    %_93 = load i8**, i8*** %_92
    %_94 = getelementptr i8*, i8** %_93, i32 17
    %_95 = load i8*, i8** %_94
    %_96 = bitcast i8* %_95 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 12
;---IN PRIMARY EXPRESSION END 1850---


    %_97 = call i32 %_96(i8* %_91 , i32 12)

    call void (i32) @print_int(i32 %_97)
    ;code snipet for printing
  ;primary: root
    %_98 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_99 = bitcast i8* %_98 to i8***
    %_100 = load i8**, i8*** %_99
    %_101 = getelementptr i8*, i8** %_100, i32 17
    %_102 = load i8*, i8** %_101
    %_103 = bitcast i8* %_102 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 16
;---IN PRIMARY EXPRESSION END 1850---


    %_104 = call i32 %_103(i8* %_98 , i32 16)

    call void (i32) @print_int(i32 %_104)
    ;code snipet for printing
  ;primary: root
    %_105 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_106 = bitcast i8* %_105 to i8***
    %_107 = load i8**, i8*** %_106
    %_108 = getelementptr i8*, i8** %_107, i32 17
    %_109 = load i8*, i8** %_108
    %_110 = bitcast i8* %_109 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 50
;---IN PRIMARY EXPRESSION END 1850---


    %_111 = call i32 %_110(i8* %_105 , i32 50)

    call void (i32) @print_int(i32 %_111)
    ;code snipet for printing
  ;primary: root
    %_112 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_113 = bitcast i8* %_112 to i8***
    %_114 = load i8**, i8*** %_113
    %_115 = getelementptr i8*, i8** %_114, i32 17
    %_116 = load i8*, i8** %_115
    %_117 = bitcast i8* %_116 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 12
;---IN PRIMARY EXPRESSION END 1850---


    %_118 = call i32 %_117(i8* %_112 , i32 12)

    call void (i32) @print_int(i32 %_118)
    ; code snipet for assignment Statemnt
  ;primary: root
    %_119 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_120 = bitcast i8* %_119 to i8***
    %_121 = load i8**, i8*** %_120
    %_122 = getelementptr i8*, i8** %_121, i32 13
    %_123 = load i8*, i8** %_122
    %_124 = bitcast i8* %_123 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 12
;---IN PRIMARY EXPRESSION END 1850---


    %_125 = call i1 %_124(i8* %_119 , i32 12)

    store i1 %_125, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: root
    %_126 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_127 = bitcast i8* %_126 to i8***
    %_128 = load i8**, i8*** %_127
    %_129 = getelementptr i8*, i8** %_128, i32 18
    %_130 = load i8*, i8** %_129
    %_131 = bitcast i8* %_130 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_132 = call i1 %_131(i8* %_126)

    store i1 %_132, i1* %ntb


    ;code snipet for printing
  ;primary: root
    %_133 = load i8*, i8** %root
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_134 = bitcast i8* %_133 to i8***
    %_135 = load i8**, i8*** %_134
    %_136 = getelementptr i8*, i8** %_135, i32 17
    %_137 = load i8*, i8** %_136
    %_138 = bitcast i8* %_137 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 12
;---IN PRIMARY EXPRESSION END 1850---


    %_139 = call i32 %_138(i8* %_133 , i32 12)

    call void (i32) @print_int(i32 %_139)
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i1 @Tree.Init(i8* %this, i32 %.v_key){
    %v_key = alloca i32
    store i32 %.v_key, i32* %v_key
    ; code snipet for assignment Statemnt
  ;primary: v_key
    %_0 = load i32, i32* %v_key
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 24
    %_2 = bitcast i8* %_1 to i32*
    store i32 %_0, i32* %_2


    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_3 = getelementptr i8, i8* %this, i32 28
    %_4 = bitcast i8* %_3 to i1*
    store i1 0, i1* %_4


    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_5 = getelementptr i8, i8* %this, i32 29
    %_6 = bitcast i8* %_5 to i1*
    store i1 0, i1* %_6


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @Tree.SetRight(i8* %this, i8* %.rn){
    %rn = alloca i8*
    store i8* %.rn, i8** %rn
    ; code snipet for assignment Statemnt
  ;primary: rn
    %_0 = load i8*, i8** %rn
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 16
    %_2 = bitcast i8* %_1 to i8**
    store i8* %_0, i8** %_2


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @Tree.SetLeft(i8* %this, i8* %.ln){
    %ln = alloca i8*
    store i8* %.ln, i8** %ln
    ; code snipet for assignment Statemnt
  ;primary: ln
    %_0 = load i8*, i8** %ln
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 8
    %_2 = bitcast i8* %_1 to i8**
    store i8* %_0, i8** %_2


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i8* @Tree.GetRight(i8* %this){
  ;primary: right
    %_0 = getelementptr i8, i8* %this, i32 16
    %_1 = bitcast i8* %_0 to i8**
    %_2 = load i8*, i8** %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i8* %_2
}
define i8* @Tree.GetLeft(i8* %this){
  ;primary: left
    %_0 = getelementptr i8, i8* %this, i32 8
    %_1 = bitcast i8* %_0 to i8**
    %_2 = load i8*, i8** %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i8* %_2
}
define i32 @Tree.GetKey(i8* %this){
  ;primary: key
    %_0 = getelementptr i8, i8* %this, i32 24
    %_1 = bitcast i8* %_0 to i32*
    %_2 = load i32, i32* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i32 %_2
}
define i1 @Tree.SetKey(i8* %this, i32 %.v_key){
    %v_key = alloca i32
    store i32 %.v_key, i32* %v_key
    ; code snipet for assignment Statemnt
  ;primary: v_key
    %_0 = load i32, i32* %v_key
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 24
    %_2 = bitcast i8* %_1 to i32*
    store i32 %_0, i32* %_2


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @Tree.GetHas_Right(i8* %this){
  ;primary: has_right
    %_0 = getelementptr i8, i8* %this, i32 29
    %_1 = bitcast i8* %_0 to i1*
    %_2 = load i1, i1* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i1 %_2
}
define i1 @Tree.GetHas_Left(i8* %this){
  ;primary: has_left
    %_0 = getelementptr i8, i8* %this, i32 28
    %_1 = bitcast i8* %_0 to i1*
    %_2 = load i1, i1* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i1 %_2
}
define i1 @Tree.SetHas_Left(i8* %this, i1 %.val){
    %val = alloca i1
    store i1 %.val, i1* %val
    ; code snipet for assignment Statemnt
  ;primary: val
    %_0 = load i1, i1* %val
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 28
    %_2 = bitcast i8* %_1 to i1*
    store i1 %_0, i1* %_2


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @Tree.SetHas_Right(i8* %this, i1 %.val){
    %val = alloca i1
    store i1 %.val, i1* %val
    ; code snipet for assignment Statemnt
  ;primary: val
    %_0 = load i1, i1* %val
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 29
    %_2 = bitcast i8* %_1 to i1*
    store i1 %_0, i1* %_2


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @Tree.Compare(i8* %this, i32 %.num1, i32 %.num2){
    %num1 = alloca i32
    store i32 %.num1, i32* %num1
    %num2 = alloca i32
    store i32 %.num2, i32* %num2
    %ntb = alloca i1
    %nti = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: num2
    %_0 = load i32, i32* %num2
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_1 = add i32 1 ,  %_0


    store i32 %_1, i32* %nti


  ;primary: num1
    %_2 = load i32, i32* %num1
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: num2
    %_3 = load i32, i32* %num2
;---IN PRIMARY EXPRESSION END 1846---


    %_4 = icmp slt i32 %_2 , %_3
    br i1 %_4, label %if_then_0, label %if_else_0
    if_then_0:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %ntb


    br label %if_end_0
    if_else_0:
  ;primary: num1
    %_5 = load i32, i32* %num1
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: nti
    %_6 = load i32, i32* %nti
;---IN PRIMARY EXPRESSION END 1846---


    %_7 = icmp slt i32 %_5 , %_6
  ;primary: %_7
;---IN PRIMARY EXPRESSION END 1850---


    %_8 = xor i1 %_7 , 1
    br i1 %_8, label %if_then_1, label %if_else_1
    if_then_1:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %ntb


    br label %if_end_1
    if_else_1:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %ntb


    br label %if_end_1
    if_end_1:
    br label %if_end_0
    if_end_0:
  ;primary: ntb
    %_9 = load i1, i1* %ntb
;---IN PRIMARY EXPRESSION END 1846---


    ret i1 %_9
}
define i1 @Tree.Insert(i8* %this, i32 %.v_key){
    %v_key = alloca i32
    store i32 %.v_key, i32* %v_key
    %cont = alloca i1
    %current_node = alloca i8*
    %key_aux = alloca i32
    %new_node = alloca i8*
    %ntb = alloca i1
    ; code snipet for assignment Statemnt
    %_0 = call i8* @calloc(i32 1, i32 38)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [21 x i8*], [21 x i8*]* @.Tree_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_0, i8 ** %new_node


    ; code snipet for assignment Statemnt
  ;primary: new_node
    %_3 = load i8*, i8** %new_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_4 = bitcast i8* %_3 to i8***
    %_5 = load i8**, i8*** %_4
    %_6 = getelementptr i8*, i8** %_5, i32 0
    %_7 = load i8*, i8** %_6
    %_8 = bitcast i8* %_7 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: v_key
    %_9 = load i32, i32* %v_key
;---IN PRIMARY EXPRESSION END 1846---


    %_10 = call i1 %_8(i8* %_3 , i32 %_9)

    store i1 %_10, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %current_node


    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %cont



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: cont
    %_11 = load i1, i1* %cont
;---IN PRIMARY EXPRESSION END 1846---


br i1%_11, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_12 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_13 = bitcast i8* %_12 to i8***
    %_14 = load i8**, i8*** %_13
    %_15 = getelementptr i8*, i8** %_14, i32 5
    %_16 = load i8*, i8** %_15
    %_17 = bitcast i8* %_16 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_18 = call i32 %_17(i8* %_12)

    store i32 %_18, i32* %key_aux


  ;primary: v_key
    %_19 = load i32, i32* %v_key
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: key_aux
    %_20 = load i32, i32* %key_aux
;---IN PRIMARY EXPRESSION END 1846---


    %_21 = icmp slt i32 %_19 , %_20
    br i1 %_21, label %if_then_1, label %if_else_1
    if_then_1:
  ;primary: current_node
    %_22 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_23 = bitcast i8* %_22 to i8***
    %_24 = load i8**, i8*** %_23
    %_25 = getelementptr i8*, i8** %_24, i32 8
    %_26 = load i8*, i8** %_25
    %_27 = bitcast i8* %_26 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_28 = call i1 %_27(i8* %_22)

    br i1 %_28, label %if_then_2, label %if_else_2
    if_then_2:
    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_29 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_30 = bitcast i8* %_29 to i8***
    %_31 = load i8**, i8*** %_30
    %_32 = getelementptr i8*, i8** %_31, i32 4
    %_33 = load i8*, i8** %_32
    %_34 = bitcast i8* %_33 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_35 = call i8* %_34(i8* %_29)

    store i8* %_35, i8** %current_node


    br label %if_end_2
    if_else_2:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont


    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_36 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_37 = bitcast i8* %_36 to i8***
    %_38 = load i8**, i8*** %_37
    %_39 = getelementptr i8*, i8** %_38, i32 9
    %_40 = load i8*, i8** %_39
    %_41 = bitcast i8* %_40 to i1 (i8 *, i1)*

    ;Code snippet for performing the call 

  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    %_42 = call i1 %_41(i8* %_36 , i1 1)

    store i1 %_42, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_43 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_44 = bitcast i8* %_43 to i8***
    %_45 = load i8**, i8*** %_44
    %_46 = getelementptr i8*, i8** %_45, i32 2
    %_47 = load i8*, i8** %_46
    %_48 = bitcast i8* %_47 to i1 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: new_node
    %_49 = load i8*, i8** %new_node
;---IN PRIMARY EXPRESSION END 1846---


    %_50 = call i1 %_48(i8* %_43 , i8* %_49)

    store i1 %_50, i1* %ntb


    br label %if_end_2
    if_end_2:
    br label %if_end_1
    if_else_1:
  ;primary: current_node
    %_51 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_52 = bitcast i8* %_51 to i8***
    %_53 = load i8**, i8*** %_52
    %_54 = getelementptr i8*, i8** %_53, i32 7
    %_55 = load i8*, i8** %_54
    %_56 = bitcast i8* %_55 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_57 = call i1 %_56(i8* %_51)

    br i1 %_57, label %if_then_3, label %if_else_3
    if_then_3:
    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_58 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_59 = bitcast i8* %_58 to i8***
    %_60 = load i8**, i8*** %_59
    %_61 = getelementptr i8*, i8** %_60, i32 3
    %_62 = load i8*, i8** %_61
    %_63 = bitcast i8* %_62 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_64 = call i8* %_63(i8* %_58)

    store i8* %_64, i8** %current_node


    br label %if_end_3
    if_else_3:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont


    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_65 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_66 = bitcast i8* %_65 to i8***
    %_67 = load i8**, i8*** %_66
    %_68 = getelementptr i8*, i8** %_67, i32 10
    %_69 = load i8*, i8** %_68
    %_70 = bitcast i8* %_69 to i1 (i8 *, i1)*

    ;Code snippet for performing the call 

  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    %_71 = call i1 %_70(i8* %_65 , i1 1)

    store i1 %_71, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_72 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_73 = bitcast i8* %_72 to i8***
    %_74 = load i8**, i8*** %_73
    %_75 = getelementptr i8*, i8** %_74, i32 1
    %_76 = load i8*, i8** %_75
    %_77 = bitcast i8* %_76 to i1 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: new_node
    %_78 = load i8*, i8** %new_node
;---IN PRIMARY EXPRESSION END 1846---


    %_79 = call i1 %_77(i8* %_72 , i8* %_78)

    store i1 %_79, i1* %ntb


    br label %if_end_3
    if_end_3:
    br label %if_end_1
    if_end_1:
br label %whileCond_0
loop_exit_0:


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @Tree.Delete(i8* %this, i32 %.v_key){
    %v_key = alloca i32
    store i32 %.v_key, i32* %v_key
    %cont = alloca i1
    %current_node = alloca i8*
    %found = alloca i1
    %is_root = alloca i1
    %key_aux = alloca i32
    %ntb = alloca i1
    %parent_node = alloca i8*
    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %current_node


    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %parent_node


    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %cont


    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %found


    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %is_root



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: cont
    %_0 = load i1, i1* %cont
;---IN PRIMARY EXPRESSION END 1846---


br i1%_0, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_1 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_2 = bitcast i8* %_1 to i8***
    %_3 = load i8**, i8*** %_2
    %_4 = getelementptr i8*, i8** %_3, i32 5
    %_5 = load i8*, i8** %_4
    %_6 = bitcast i8* %_5 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_7 = call i32 %_6(i8* %_1)

    store i32 %_7, i32* %key_aux


  ;primary: v_key
    %_8 = load i32, i32* %v_key
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: key_aux
    %_9 = load i32, i32* %key_aux
;---IN PRIMARY EXPRESSION END 1846---


    %_10 = icmp slt i32 %_8 , %_9
    br i1 %_10, label %if_then_1, label %if_else_1
    if_then_1:
  ;primary: current_node
    %_11 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_12 = bitcast i8* %_11 to i8***
    %_13 = load i8**, i8*** %_12
    %_14 = getelementptr i8*, i8** %_13, i32 8
    %_15 = load i8*, i8** %_14
    %_16 = bitcast i8* %_15 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_17 = call i1 %_16(i8* %_11)

    br i1 %_17, label %if_then_2, label %if_else_2
    if_then_2:
    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_18 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---


    store i8* %_18, i8** %parent_node


    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_19 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_20 = bitcast i8* %_19 to i8***
    %_21 = load i8**, i8*** %_20
    %_22 = getelementptr i8*, i8** %_21, i32 4
    %_23 = load i8*, i8** %_22
    %_24 = bitcast i8* %_23 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_25 = call i8* %_24(i8* %_19)

    store i8* %_25, i8** %current_node


    br label %if_end_2
    if_else_2:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont


    br label %if_end_2
    if_end_2:
    br label %if_end_1
    if_else_1:
  ;primary: key_aux
    %_26 = load i32, i32* %key_aux
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: v_key
    %_27 = load i32, i32* %v_key
;---IN PRIMARY EXPRESSION END 1846---


    %_28 = icmp slt i32 %_26 , %_27
    br i1 %_28, label %if_then_3, label %if_else_3
    if_then_3:
  ;primary: current_node
    %_29 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_30 = bitcast i8* %_29 to i8***
    %_31 = load i8**, i8*** %_30
    %_32 = getelementptr i8*, i8** %_31, i32 7
    %_33 = load i8*, i8** %_32
    %_34 = bitcast i8* %_33 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_35 = call i1 %_34(i8* %_29)

    br i1 %_35, label %if_then_4, label %if_else_4
    if_then_4:
    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_36 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---


    store i8* %_36, i8** %parent_node


    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_37 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_38 = bitcast i8* %_37 to i8***
    %_39 = load i8**, i8*** %_38
    %_40 = getelementptr i8*, i8** %_39, i32 3
    %_41 = load i8*, i8** %_40
    %_42 = bitcast i8* %_41 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_43 = call i8* %_42(i8* %_37)

    store i8* %_43, i8** %current_node


    br label %if_end_4
    if_else_4:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont


    br label %if_end_4
    if_end_4:
    br label %if_end_3
    if_else_3:
  ;primary: is_root
    %_44 = load i1, i1* %is_root
;---IN PRIMARY EXPRESSION END 1846---


    br i1 %_44, label %if_then_5, label %if_else_5
    if_then_5:
 ; Check result, short circuit if false
  ;primary: current_node
    %_45 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_46 = bitcast i8* %_45 to i8***
    %_47 = load i8**, i8*** %_46
    %_48 = getelementptr i8*, i8** %_47, i32 7
    %_49 = load i8*, i8** %_48
    %_50 = bitcast i8* %_49 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_51 = call i1 %_50(i8* %_45)

  ;primary: %_51
;---IN PRIMARY EXPRESSION END 1850---


    %_52 = xor i1 %_51 , 1
    br i1 %_52, label %exp_res_61, label %exp_res_6
    exp_res_6:
    br label %exp_res_63

    exp_res_61:
  ;primary: current_node
    %_53 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_54 = bitcast i8* %_53 to i8***
    %_55 = load i8**, i8*** %_54
    %_56 = getelementptr i8*, i8** %_55, i32 8
    %_57 = load i8*, i8** %_56
    %_58 = bitcast i8* %_57 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_59 = call i1 %_58(i8* %_53)

  ;primary: %_59
;---IN PRIMARY EXPRESSION END 1850---


    %_60 = xor i1 %_59 , 1
    br label %exp_res_62

   exp_res_62:
    br label %exp_res_63

      exp_res_63:
    %_61 = phi i1  [ 0, %exp_res_6 ], [ %_60, %exp_res_62 ]
    br i1 %_61, label %if_then_10, label %if_else_10
    if_then_10:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %ntb


    br label %if_end_10
    if_else_10:
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_62 = bitcast i8* %this to i8***
    %_63 = load i8**, i8*** %_62
    %_64 = getelementptr i8*, i8** %_63, i32 14
    %_65 = load i8*, i8** %_64
    %_66 = bitcast i8* %_65 to i1 (i8 *, i8*, i8*)*

    ;Code snippet for performing the call 

  ;primary: parent_node
    %_67 = load i8*, i8** %parent_node
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: current_node
    %_68 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---


    %_69 = call i1 %_66(i8* %this , i8* %_67, i8* %_68)

    store i1 %_69, i1* %ntb


    br label %if_end_10
    if_end_10:
    br label %if_end_5
    if_else_5:
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_70 = bitcast i8* %this to i8***
    %_71 = load i8**, i8*** %_70
    %_72 = getelementptr i8*, i8** %_71, i32 14
    %_73 = load i8*, i8** %_72
    %_74 = bitcast i8* %_73 to i1 (i8 *, i8*, i8*)*

    ;Code snippet for performing the call 

  ;primary: parent_node
    %_75 = load i8*, i8** %parent_node
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: current_node
    %_76 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---


    %_77 = call i1 %_74(i8* %this , i8* %_75, i8* %_76)

    store i1 %_77, i1* %ntb


    br label %if_end_5
    if_end_5:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %found


    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont


    br label %if_end_3
    if_end_3:
    br label %if_end_1
    if_end_1:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %is_root


br label %whileCond_0
loop_exit_0:


  ;primary: found
    %_78 = load i1, i1* %found
;---IN PRIMARY EXPRESSION END 1846---


    ret i1 %_78
}
define i1 @Tree.Remove(i8* %this, i8* %.p_node, i8* %.c_node){
    %p_node = alloca i8*
    store i8* %.p_node, i8** %p_node
    %c_node = alloca i8*
    store i8* %.c_node, i8** %c_node
    %auxkey1 = alloca i32
    %auxkey2 = alloca i32
    %ntb = alloca i1
  ;primary: c_node
    %_0 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_1 = bitcast i8* %_0 to i8***
    %_2 = load i8**, i8*** %_1
    %_3 = getelementptr i8*, i8** %_2, i32 8
    %_4 = load i8*, i8** %_3
    %_5 = bitcast i8* %_4 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_6 = call i1 %_5(i8* %_0)

    br i1 %_6, label %if_then_0, label %if_else_0
    if_then_0:
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_7 = bitcast i8* %this to i8***
    %_8 = load i8**, i8*** %_7
    %_9 = getelementptr i8*, i8** %_8, i32 16
    %_10 = load i8*, i8** %_9
    %_11 = bitcast i8* %_10 to i1 (i8 *, i8*, i8*)*

    ;Code snippet for performing the call 

  ;primary: p_node
    %_12 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: c_node
    %_13 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---


    %_14 = call i1 %_11(i8* %this , i8* %_12, i8* %_13)

    store i1 %_14, i1* %ntb


    br label %if_end_0
    if_else_0:
  ;primary: c_node
    %_15 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_16 = bitcast i8* %_15 to i8***
    %_17 = load i8**, i8*** %_16
    %_18 = getelementptr i8*, i8** %_17, i32 7
    %_19 = load i8*, i8** %_18
    %_20 = bitcast i8* %_19 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_21 = call i1 %_20(i8* %_15)

    br i1 %_21, label %if_then_1, label %if_else_1
    if_then_1:
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_22 = bitcast i8* %this to i8***
    %_23 = load i8**, i8*** %_22
    %_24 = getelementptr i8*, i8** %_23, i32 15
    %_25 = load i8*, i8** %_24
    %_26 = bitcast i8* %_25 to i1 (i8 *, i8*, i8*)*

    ;Code snippet for performing the call 

  ;primary: p_node
    %_27 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: c_node
    %_28 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---


    %_29 = call i1 %_26(i8* %this , i8* %_27, i8* %_28)

    store i1 %_29, i1* %ntb


    br label %if_end_1
    if_else_1:
    ; code snipet for assignment Statemnt
  ;primary: c_node
    %_30 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_31 = bitcast i8* %_30 to i8***
    %_32 = load i8**, i8*** %_31
    %_33 = getelementptr i8*, i8** %_32, i32 5
    %_34 = load i8*, i8** %_33
    %_35 = bitcast i8* %_34 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_36 = call i32 %_35(i8* %_30)

    store i32 %_36, i32* %auxkey1


    ; code snipet for assignment Statemnt
  ;primary: p_node
    %_37 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_38 = bitcast i8* %_37 to i8***
    %_39 = load i8**, i8*** %_38
    %_40 = getelementptr i8*, i8** %_39, i32 4
    %_41 = load i8*, i8** %_40
    %_42 = bitcast i8* %_41 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_43 = call i8* %_42(i8* %_37)

  ;primary: %_43
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_44 = bitcast i8* %_43 to i8***
    %_45 = load i8**, i8*** %_44
    %_46 = getelementptr i8*, i8** %_45, i32 5
    %_47 = load i8*, i8** %_46
    %_48 = bitcast i8* %_47 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_49 = call i32 %_48(i8* %_43)

    store i32 %_49, i32* %auxkey2


  ;primary: this

   ;Code snippet for MessageSend

    %_50 = bitcast i8* %this to i8***
    %_51 = load i8**, i8*** %_50
    %_52 = getelementptr i8*, i8** %_51, i32 11
    %_53 = load i8*, i8** %_52
    %_54 = bitcast i8* %_53 to i1 (i8 *, i32, i32)*

    ;Code snippet for performing the call 

  ;primary: auxkey1
    %_55 = load i32, i32* %auxkey1
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: auxkey2
    %_56 = load i32, i32* %auxkey2
;---IN PRIMARY EXPRESSION END 1846---


    %_57 = call i1 %_54(i8* %this , i32 %_55, i32 %_56)

    br i1 %_57, label %if_then_2, label %if_else_2
    if_then_2:
    ; code snipet for assignment Statemnt
  ;primary: p_node
    %_58 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_59 = bitcast i8* %_58 to i8***
    %_60 = load i8**, i8*** %_59
    %_61 = getelementptr i8*, i8** %_60, i32 2
    %_62 = load i8*, i8** %_61
    %_63 = bitcast i8* %_62 to i1 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: my_null
    %_64 = getelementptr i8, i8* %this, i32 30
    %_65 = bitcast i8* %_64 to i8**
    %_66 = load i8*, i8** %_65
;---IN PRIMARY EXPRESSION END 1838 ---


    %_67 = call i1 %_63(i8* %_58 , i8* %_66)

    store i1 %_67, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: p_node
    %_68 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_69 = bitcast i8* %_68 to i8***
    %_70 = load i8**, i8*** %_69
    %_71 = getelementptr i8*, i8** %_70, i32 9
    %_72 = load i8*, i8** %_71
    %_73 = bitcast i8* %_72 to i1 (i8 *, i1)*

    ;Code snippet for performing the call 

  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_74 = call i1 %_73(i8* %_68 , i1 0)

    store i1 %_74, i1* %ntb


    br label %if_end_2
    if_else_2:
    ; code snipet for assignment Statemnt
  ;primary: p_node
    %_75 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_76 = bitcast i8* %_75 to i8***
    %_77 = load i8**, i8*** %_76
    %_78 = getelementptr i8*, i8** %_77, i32 1
    %_79 = load i8*, i8** %_78
    %_80 = bitcast i8* %_79 to i1 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: my_null
    %_81 = getelementptr i8, i8* %this, i32 30
    %_82 = bitcast i8* %_81 to i8**
    %_83 = load i8*, i8** %_82
;---IN PRIMARY EXPRESSION END 1838 ---


    %_84 = call i1 %_80(i8* %_75 , i8* %_83)

    store i1 %_84, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: p_node
    %_85 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_86 = bitcast i8* %_85 to i8***
    %_87 = load i8**, i8*** %_86
    %_88 = getelementptr i8*, i8** %_87, i32 10
    %_89 = load i8*, i8** %_88
    %_90 = bitcast i8* %_89 to i1 (i8 *, i1)*

    ;Code snippet for performing the call 

  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_91 = call i1 %_90(i8* %_85 , i1 0)

    store i1 %_91, i1* %ntb


    br label %if_end_2
    if_end_2:
    br label %if_end_1
    if_end_1:
    br label %if_end_0
    if_end_0:
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @Tree.RemoveRight(i8* %this, i8* %.p_node, i8* %.c_node){
    %p_node = alloca i8*
    store i8* %.p_node, i8** %p_node
    %c_node = alloca i8*
    store i8* %.c_node, i8** %c_node
    %ntb = alloca i1

  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: c_node
    %_0 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_1 = bitcast i8* %_0 to i8***
    %_2 = load i8**, i8*** %_1
    %_3 = getelementptr i8*, i8** %_2, i32 7
    %_4 = load i8*, i8** %_3
    %_5 = bitcast i8* %_4 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_6 = call i1 %_5(i8* %_0)

br i1%_6, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ; code snipet for assignment Statemnt
  ;primary: c_node
    %_7 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_8 = bitcast i8* %_7 to i8***
    %_9 = load i8**, i8*** %_8
    %_10 = getelementptr i8*, i8** %_9, i32 6
    %_11 = load i8*, i8** %_10
    %_12 = bitcast i8* %_11 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: c_node
    %_13 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_14 = bitcast i8* %_13 to i8***
    %_15 = load i8**, i8*** %_14
    %_16 = getelementptr i8*, i8** %_15, i32 3
    %_17 = load i8*, i8** %_16
    %_18 = bitcast i8* %_17 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_19 = call i8* %_18(i8* %_13)

  ;primary: %_19
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_20 = bitcast i8* %_19 to i8***
    %_21 = load i8**, i8*** %_20
    %_22 = getelementptr i8*, i8** %_21, i32 5
    %_23 = load i8*, i8** %_22
    %_24 = bitcast i8* %_23 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_25 = call i32 %_24(i8* %_19)

    %_26 = call i1 %_12(i8* %_7 , i32 %_25)

    store i1 %_26, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: c_node
    %_27 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---


    store i8* %_27, i8** %p_node


    ; code snipet for assignment Statemnt
  ;primary: c_node
    %_28 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_29 = bitcast i8* %_28 to i8***
    %_30 = load i8**, i8*** %_29
    %_31 = getelementptr i8*, i8** %_30, i32 3
    %_32 = load i8*, i8** %_31
    %_33 = bitcast i8* %_32 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_34 = call i8* %_33(i8* %_28)

    store i8* %_34, i8** %c_node


br label %whileCond_0
loop_exit_0:


    ; code snipet for assignment Statemnt
  ;primary: p_node
    %_35 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_36 = bitcast i8* %_35 to i8***
    %_37 = load i8**, i8*** %_36
    %_38 = getelementptr i8*, i8** %_37, i32 1
    %_39 = load i8*, i8** %_38
    %_40 = bitcast i8* %_39 to i1 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: my_null
    %_41 = getelementptr i8, i8* %this, i32 30
    %_42 = bitcast i8* %_41 to i8**
    %_43 = load i8*, i8** %_42
;---IN PRIMARY EXPRESSION END 1838 ---


    %_44 = call i1 %_40(i8* %_35 , i8* %_43)

    store i1 %_44, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: p_node
    %_45 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_46 = bitcast i8* %_45 to i8***
    %_47 = load i8**, i8*** %_46
    %_48 = getelementptr i8*, i8** %_47, i32 10
    %_49 = load i8*, i8** %_48
    %_50 = bitcast i8* %_49 to i1 (i8 *, i1)*

    ;Code snippet for performing the call 

  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_51 = call i1 %_50(i8* %_45 , i1 0)

    store i1 %_51, i1* %ntb


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @Tree.RemoveLeft(i8* %this, i8* %.p_node, i8* %.c_node){
    %p_node = alloca i8*
    store i8* %.p_node, i8** %p_node
    %c_node = alloca i8*
    store i8* %.c_node, i8** %c_node
    %ntb = alloca i1

  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: c_node
    %_0 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_1 = bitcast i8* %_0 to i8***
    %_2 = load i8**, i8*** %_1
    %_3 = getelementptr i8*, i8** %_2, i32 8
    %_4 = load i8*, i8** %_3
    %_5 = bitcast i8* %_4 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_6 = call i1 %_5(i8* %_0)

br i1%_6, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ; code snipet for assignment Statemnt
  ;primary: c_node
    %_7 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_8 = bitcast i8* %_7 to i8***
    %_9 = load i8**, i8*** %_8
    %_10 = getelementptr i8*, i8** %_9, i32 6
    %_11 = load i8*, i8** %_10
    %_12 = bitcast i8* %_11 to i1 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: c_node
    %_13 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_14 = bitcast i8* %_13 to i8***
    %_15 = load i8**, i8*** %_14
    %_16 = getelementptr i8*, i8** %_15, i32 4
    %_17 = load i8*, i8** %_16
    %_18 = bitcast i8* %_17 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_19 = call i8* %_18(i8* %_13)

  ;primary: %_19
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_20 = bitcast i8* %_19 to i8***
    %_21 = load i8**, i8*** %_20
    %_22 = getelementptr i8*, i8** %_21, i32 5
    %_23 = load i8*, i8** %_22
    %_24 = bitcast i8* %_23 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_25 = call i32 %_24(i8* %_19)

    %_26 = call i1 %_12(i8* %_7 , i32 %_25)

    store i1 %_26, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: c_node
    %_27 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---


    store i8* %_27, i8** %p_node


    ; code snipet for assignment Statemnt
  ;primary: c_node
    %_28 = load i8*, i8** %c_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_29 = bitcast i8* %_28 to i8***
    %_30 = load i8**, i8*** %_29
    %_31 = getelementptr i8*, i8** %_30, i32 4
    %_32 = load i8*, i8** %_31
    %_33 = bitcast i8* %_32 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_34 = call i8* %_33(i8* %_28)

    store i8* %_34, i8** %c_node


br label %whileCond_0
loop_exit_0:


    ; code snipet for assignment Statemnt
  ;primary: p_node
    %_35 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_36 = bitcast i8* %_35 to i8***
    %_37 = load i8**, i8*** %_36
    %_38 = getelementptr i8*, i8** %_37, i32 2
    %_39 = load i8*, i8** %_38
    %_40 = bitcast i8* %_39 to i1 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: my_null
    %_41 = getelementptr i8, i8* %this, i32 30
    %_42 = bitcast i8* %_41 to i8**
    %_43 = load i8*, i8** %_42
;---IN PRIMARY EXPRESSION END 1838 ---


    %_44 = call i1 %_40(i8* %_35 , i8* %_43)

    store i1 %_44, i1* %ntb


    ; code snipet for assignment Statemnt
  ;primary: p_node
    %_45 = load i8*, i8** %p_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_46 = bitcast i8* %_45 to i8***
    %_47 = load i8**, i8*** %_46
    %_48 = getelementptr i8*, i8** %_47, i32 9
    %_49 = load i8*, i8** %_48
    %_50 = bitcast i8* %_49 to i1 (i8 *, i1)*

    ;Code snippet for performing the call 

  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_51 = call i1 %_50(i8* %_45 , i1 0)

    store i1 %_51, i1* %ntb


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i32 @Tree.Search(i8* %this, i32 %.v_key){
    %v_key = alloca i32
    store i32 %.v_key, i32* %v_key
    %cont = alloca i1
    %current_node = alloca i8*
    %ifound = alloca i32
    %key_aux = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %current_node


    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %cont


    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %ifound



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: cont
    %_0 = load i1, i1* %cont
;---IN PRIMARY EXPRESSION END 1846---


br i1%_0, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_1 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_2 = bitcast i8* %_1 to i8***
    %_3 = load i8**, i8*** %_2
    %_4 = getelementptr i8*, i8** %_3, i32 5
    %_5 = load i8*, i8** %_4
    %_6 = bitcast i8* %_5 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_7 = call i32 %_6(i8* %_1)

    store i32 %_7, i32* %key_aux


  ;primary: v_key
    %_8 = load i32, i32* %v_key
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: key_aux
    %_9 = load i32, i32* %key_aux
;---IN PRIMARY EXPRESSION END 1846---


    %_10 = icmp slt i32 %_8 , %_9
    br i1 %_10, label %if_then_1, label %if_else_1
    if_then_1:
  ;primary: current_node
    %_11 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_12 = bitcast i8* %_11 to i8***
    %_13 = load i8**, i8*** %_12
    %_14 = getelementptr i8*, i8** %_13, i32 8
    %_15 = load i8*, i8** %_14
    %_16 = bitcast i8* %_15 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_17 = call i1 %_16(i8* %_11)

    br i1 %_17, label %if_then_2, label %if_else_2
    if_then_2:
    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_18 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_19 = bitcast i8* %_18 to i8***
    %_20 = load i8**, i8*** %_19
    %_21 = getelementptr i8*, i8** %_20, i32 4
    %_22 = load i8*, i8** %_21
    %_23 = bitcast i8* %_22 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_24 = call i8* %_23(i8* %_18)

    store i8* %_24, i8** %current_node


    br label %if_end_2
    if_else_2:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont


    br label %if_end_2
    if_end_2:
    br label %if_end_1
    if_else_1:
  ;primary: key_aux
    %_25 = load i32, i32* %key_aux
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: v_key
    %_26 = load i32, i32* %v_key
;---IN PRIMARY EXPRESSION END 1846---


    %_27 = icmp slt i32 %_25 , %_26
    br i1 %_27, label %if_then_3, label %if_else_3
    if_then_3:
  ;primary: current_node
    %_28 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_29 = bitcast i8* %_28 to i8***
    %_30 = load i8**, i8*** %_29
    %_31 = getelementptr i8*, i8** %_30, i32 7
    %_32 = load i8*, i8** %_31
    %_33 = bitcast i8* %_32 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_34 = call i1 %_33(i8* %_28)

    br i1 %_34, label %if_then_4, label %if_else_4
    if_then_4:
    ; code snipet for assignment Statemnt
  ;primary: current_node
    %_35 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_36 = bitcast i8* %_35 to i8***
    %_37 = load i8**, i8*** %_36
    %_38 = getelementptr i8*, i8** %_37, i32 3
    %_39 = load i8*, i8** %_38
    %_40 = bitcast i8* %_39 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_41 = call i8* %_40(i8* %_35)

    store i8* %_41, i8** %current_node


    br label %if_end_4
    if_else_4:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont


    br label %if_end_4
    if_end_4:
    br label %if_end_3
    if_else_3:
    ; code snipet for assignment Statemnt
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    store i32 1, i32* %ifound


    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont


    br label %if_end_3
    if_end_3:
    br label %if_end_1
    if_end_1:
br label %whileCond_0
loop_exit_0:


  ;primary: ifound
    %_42 = load i32, i32* %ifound
;---IN PRIMARY EXPRESSION END 1846---


    ret i32 %_42
}
define i1 @Tree.Print(i8* %this){
    %current_node = alloca i8*
    %ntb = alloca i1
    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %current_node


    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_0 = bitcast i8* %this to i8***
    %_1 = load i8**, i8*** %_0
    %_2 = getelementptr i8*, i8** %_1, i32 19
    %_3 = load i8*, i8** %_2
    %_4 = bitcast i8* %_3 to i1 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: current_node
    %_5 = load i8*, i8** %current_node
;---IN PRIMARY EXPRESSION END 1846---


    %_6 = call i1 %_4(i8* %this , i8* %_5)

    store i1 %_6, i1* %ntb


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @Tree.RecPrint(i8* %this, i8* %.node){
    %node = alloca i8*
    store i8* %.node, i8** %node
    %ntb = alloca i1
  ;primary: node
    %_0 = load i8*, i8** %node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_1 = bitcast i8* %_0 to i8***
    %_2 = load i8**, i8*** %_1
    %_3 = getelementptr i8*, i8** %_2, i32 8
    %_4 = load i8*, i8** %_3
    %_5 = bitcast i8* %_4 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_6 = call i1 %_5(i8* %_0)

    br i1 %_6, label %if_then_0, label %if_else_0
    if_then_0:
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_7 = bitcast i8* %this to i8***
    %_8 = load i8**, i8*** %_7
    %_9 = getelementptr i8*, i8** %_8, i32 19
    %_10 = load i8*, i8** %_9
    %_11 = bitcast i8* %_10 to i1 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: node
    %_12 = load i8*, i8** %node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_13 = bitcast i8* %_12 to i8***
    %_14 = load i8**, i8*** %_13
    %_15 = getelementptr i8*, i8** %_14, i32 4
    %_16 = load i8*, i8** %_15
    %_17 = bitcast i8* %_16 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_18 = call i8* %_17(i8* %_12)

    %_19 = call i1 %_11(i8* %this , i8* %_18)

    store i1 %_19, i1* %ntb


    br label %if_end_0
    if_else_0:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %ntb


    br label %if_end_0
    if_end_0:
    ;code snipet for printing
  ;primary: node
    %_20 = load i8*, i8** %node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_21 = bitcast i8* %_20 to i8***
    %_22 = load i8**, i8*** %_21
    %_23 = getelementptr i8*, i8** %_22, i32 5
    %_24 = load i8*, i8** %_23
    %_25 = bitcast i8* %_24 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_26 = call i32 %_25(i8* %_20)

    call void (i32) @print_int(i32 %_26)
  ;primary: node
    %_27 = load i8*, i8** %node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_28 = bitcast i8* %_27 to i8***
    %_29 = load i8**, i8*** %_28
    %_30 = getelementptr i8*, i8** %_29, i32 7
    %_31 = load i8*, i8** %_30
    %_32 = bitcast i8* %_31 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_33 = call i1 %_32(i8* %_27)

    br i1 %_33, label %if_then_1, label %if_else_1
    if_then_1:
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_34 = bitcast i8* %this to i8***
    %_35 = load i8**, i8*** %_34
    %_36 = getelementptr i8*, i8** %_35, i32 19
    %_37 = load i8*, i8** %_36
    %_38 = bitcast i8* %_37 to i1 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: node
    %_39 = load i8*, i8** %node
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_40 = bitcast i8* %_39 to i8***
    %_41 = load i8**, i8*** %_40
    %_42 = getelementptr i8*, i8** %_41, i32 3
    %_43 = load i8*, i8** %_42
    %_44 = bitcast i8* %_43 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_45 = call i8* %_44(i8* %_39)

    %_46 = call i1 %_38(i8* %this , i8* %_45)

    store i1 %_46, i1* %ntb


    br label %if_end_1
    if_else_1:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %ntb


    br label %if_end_1
    if_end_1:
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i32 @Tree.accept(i8* %this, i8* %.v){
    %v = alloca i8*
    store i8* %.v, i8** %v
    %nti = alloca i32
    ;code snipet for printing
  ;primary: 333
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 333)
    ; code snipet for assignment Statemnt
  ;primary: v
    %_0 = load i8*, i8** %v
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_1 = bitcast i8* %_0 to i8***
    %_2 = load i8**, i8*** %_1
    %_3 = getelementptr i8*, i8** %_2, i32 0
    %_4 = load i8*, i8** %_3
    %_5 = bitcast i8* %_4 to i32 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: this
    %_6 = call i32 %_5(i8* %_0 , i8* %this)

    store i32 %_6, i32* %nti


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i32 @Visitor.visit(i8* %this, i8* %.n){
    %n = alloca i8*
    store i8* %.n, i8** %n
    %nti = alloca i32
  ;primary: n
    %_0 = load i8*, i8** %n
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_1 = bitcast i8* %_0 to i8***
    %_2 = load i8**, i8*** %_1
    %_3 = getelementptr i8*, i8** %_2, i32 7
    %_4 = load i8*, i8** %_3
    %_5 = bitcast i8* %_4 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_6 = call i1 %_5(i8* %_0)

    br i1 %_6, label %if_then_0, label %if_else_0
    if_then_0:
    ; code snipet for assignment Statemnt
  ;primary: n
    %_7 = load i8*, i8** %n
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_8 = bitcast i8* %_7 to i8***
    %_9 = load i8**, i8*** %_8
    %_10 = getelementptr i8*, i8** %_9, i32 3
    %_11 = load i8*, i8** %_10
    %_12 = bitcast i8* %_11 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_13 = call i8* %_12(i8* %_7)

    %_14 = getelementptr i8, i8* %this, i32 16
    %_15 = bitcast i8* %_14 to i8**
    store i8* %_13, i8** %_15


    ; code snipet for assignment Statemnt
  ;primary: r
    %_16 = getelementptr i8, i8* %this, i32 16
    %_17 = bitcast i8* %_16 to i8**
    %_18 = load i8*, i8** %_17
;---IN PRIMARY EXPRESSION END 1838 ---



   ;Code snippet for MessageSend

    %_19 = bitcast i8* %_18 to i8***
    %_20 = load i8**, i8*** %_19
    %_21 = getelementptr i8*, i8** %_20, i32 20
    %_22 = load i8*, i8** %_21
    %_23 = bitcast i8* %_22 to i32 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: this
    %_24 = call i32 %_23(i8* %_18 , i8* %this)

    store i32 %_24, i32* %nti


    br label %if_end_0
    if_else_0:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nti


    br label %if_end_0
    if_end_0:
  ;primary: n
    %_25 = load i8*, i8** %n
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_26 = bitcast i8* %_25 to i8***
    %_27 = load i8**, i8*** %_26
    %_28 = getelementptr i8*, i8** %_27, i32 8
    %_29 = load i8*, i8** %_28
    %_30 = bitcast i8* %_29 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_31 = call i1 %_30(i8* %_25)

    br i1 %_31, label %if_then_1, label %if_else_1
    if_then_1:
    ; code snipet for assignment Statemnt
  ;primary: n
    %_32 = load i8*, i8** %n
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_33 = bitcast i8* %_32 to i8***
    %_34 = load i8**, i8*** %_33
    %_35 = getelementptr i8*, i8** %_34, i32 4
    %_36 = load i8*, i8** %_35
    %_37 = bitcast i8* %_36 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_38 = call i8* %_37(i8* %_32)

    %_39 = getelementptr i8, i8* %this, i32 8
    %_40 = bitcast i8* %_39 to i8**
    store i8* %_38, i8** %_40


    ; code snipet for assignment Statemnt
  ;primary: l
    %_41 = getelementptr i8, i8* %this, i32 8
    %_42 = bitcast i8* %_41 to i8**
    %_43 = load i8*, i8** %_42
;---IN PRIMARY EXPRESSION END 1838 ---



   ;Code snippet for MessageSend

    %_44 = bitcast i8* %_43 to i8***
    %_45 = load i8**, i8*** %_44
    %_46 = getelementptr i8*, i8** %_45, i32 20
    %_47 = load i8*, i8** %_46
    %_48 = bitcast i8* %_47 to i32 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: this
    %_49 = call i32 %_48(i8* %_43 , i8* %this)

    store i32 %_49, i32* %nti


    br label %if_end_1
    if_else_1:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nti


    br label %if_end_1
    if_end_1:
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i32 @MyVisitor.visit(i8* %this, i8* %.n){
    %n = alloca i8*
    store i8* %.n, i8** %n
    %nti = alloca i32
  ;primary: n
    %_0 = load i8*, i8** %n
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_1 = bitcast i8* %_0 to i8***
    %_2 = load i8**, i8*** %_1
    %_3 = getelementptr i8*, i8** %_2, i32 7
    %_4 = load i8*, i8** %_3
    %_5 = bitcast i8* %_4 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_6 = call i1 %_5(i8* %_0)

    br i1 %_6, label %if_then_0, label %if_else_0
    if_then_0:
    ; code snipet for assignment Statemnt
  ;primary: n
    %_7 = load i8*, i8** %n
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_8 = bitcast i8* %_7 to i8***
    %_9 = load i8**, i8*** %_8
    %_10 = getelementptr i8*, i8** %_9, i32 3
    %_11 = load i8*, i8** %_10
    %_12 = bitcast i8* %_11 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_13 = call i8* %_12(i8* %_7)

    %_14 = getelementptr i8, i8* %this, i32 16
    %_15 = bitcast i8* %_14 to i8**
    store i8* %_13, i8** %_15


    ; code snipet for assignment Statemnt
  ;primary: r
    %_16 = getelementptr i8, i8* %this, i32 16
    %_17 = bitcast i8* %_16 to i8**
    %_18 = load i8*, i8** %_17
;---IN PRIMARY EXPRESSION END 1838 ---



   ;Code snippet for MessageSend

    %_19 = bitcast i8* %_18 to i8***
    %_20 = load i8**, i8*** %_19
    %_21 = getelementptr i8*, i8** %_20, i32 20
    %_22 = load i8*, i8** %_21
    %_23 = bitcast i8* %_22 to i32 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: this
    %_24 = call i32 %_23(i8* %_18 , i8* %this)

    store i32 %_24, i32* %nti


    br label %if_end_0
    if_else_0:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nti


    br label %if_end_0
    if_end_0:
    ;code snipet for printing
  ;primary: n
    %_25 = load i8*, i8** %n
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_26 = bitcast i8* %_25 to i8***
    %_27 = load i8**, i8*** %_26
    %_28 = getelementptr i8*, i8** %_27, i32 5
    %_29 = load i8*, i8** %_28
    %_30 = bitcast i8* %_29 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_31 = call i32 %_30(i8* %_25)

    call void (i32) @print_int(i32 %_31)
  ;primary: n
    %_32 = load i8*, i8** %n
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_33 = bitcast i8* %_32 to i8***
    %_34 = load i8**, i8*** %_33
    %_35 = getelementptr i8*, i8** %_34, i32 8
    %_36 = load i8*, i8** %_35
    %_37 = bitcast i8* %_36 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_38 = call i1 %_37(i8* %_32)

    br i1 %_38, label %if_then_1, label %if_else_1
    if_then_1:
    ; code snipet for assignment Statemnt
  ;primary: n
    %_39 = load i8*, i8** %n
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_40 = bitcast i8* %_39 to i8***
    %_41 = load i8**, i8*** %_40
    %_42 = getelementptr i8*, i8** %_41, i32 4
    %_43 = load i8*, i8** %_42
    %_44 = bitcast i8* %_43 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_45 = call i8* %_44(i8* %_39)

    %_46 = getelementptr i8, i8* %this, i32 8
    %_47 = bitcast i8* %_46 to i8**
    store i8* %_45, i8** %_47


    ; code snipet for assignment Statemnt
  ;primary: l
    %_48 = getelementptr i8, i8* %this, i32 8
    %_49 = bitcast i8* %_48 to i8**
    %_50 = load i8*, i8** %_49
;---IN PRIMARY EXPRESSION END 1838 ---



   ;Code snippet for MessageSend

    %_51 = bitcast i8* %_50 to i8***
    %_52 = load i8**, i8*** %_51
    %_53 = getelementptr i8*, i8** %_52, i32 20
    %_54 = load i8*, i8** %_53
    %_55 = bitcast i8* %_54 to i32 (i8 *, i8*)*

    ;Code snippet for performing the call 

  ;primary: this
    %_56 = call i32 %_55(i8* %_50 , i8* %this)

    store i32 %_56, i32* %nti


    br label %if_end_1
    if_else_1:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nti


    br label %if_end_1
    if_end_1:
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
