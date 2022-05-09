

@.QS_vtable=global[4 x i8*] [
	i8 * bitcast(i32(i8 *, i32) * @QS.Start to i8 *),
	i8 * bitcast(i32(i8 *, i32, i32) * @QS.Sort to i8 *),
	i8 * bitcast(i32(i8 *) * @QS.Print to i8 *),
	i8 * bitcast(i32(i8 *, i32) * @QS.Init to i8 *)
]
@.QuickSort_vtable=global[0 x i8*] []
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
    %_0 = call i8* @calloc(i32 1, i32 20)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [4 x i8*], [4 x i8*]* @.QS_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_3 = bitcast i8* %_0 to i8***
    %_4 = load i8**, i8*** %_3
    %_5 = getelementptr i8*, i8** %_4, i32 0
    %_6 = load i8*, i8** %_5
    %_7 = bitcast i8* %_6 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 10
;---IN PRIMARY EXPRESSION END 1850---


    %_8 = call i32 %_7(i8* %_0 , i32 10)

    call void (i32) @print_int(i32 %_8)
    ret i32 0
}
define i32 @QS.Start(i8* %this, i32 %.sz){
    %sz = alloca i32
    store i32 %.sz, i32* %sz
    %aux01 = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_0 = bitcast i8* %this to i8***
    %_1 = load i8**, i8*** %_0
    %_2 = getelementptr i8*, i8** %_1, i32 3
    %_3 = load i8*, i8** %_2
    %_4 = bitcast i8* %_3 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: sz
    %_5 = load i32, i32* %sz
;---IN PRIMARY EXPRESSION END 1846---


    %_6 = call i32 %_4(i8* %this , i32 %_5)

    store i32 %_6, i32* %aux01


    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_7 = bitcast i8* %this to i8***
    %_8 = load i8**, i8*** %_7
    %_9 = getelementptr i8*, i8** %_8, i32 2
    %_10 = load i8*, i8** %_9
    %_11 = bitcast i8* %_10 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_12 = call i32 %_11(i8* %this)

    store i32 %_12, i32* %aux01


    ;code snipet for printing
  ;primary: 9999
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 9999)
    ; code snipet for assignment Statemnt
  ;primary: size
    %_13 = getelementptr i8, i8* %this, i32 16
    %_14 = bitcast i8* %_13 to i32*
    %_15 = load i32, i32* %_14
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_16 = sub i32  1 ,  %_15


    store i32 %_16, i32* %aux01


    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_17 = bitcast i8* %this to i8***
    %_18 = load i8**, i8*** %_17
    %_19 = getelementptr i8*, i8** %_18, i32 1
    %_20 = load i8*, i8** %_19
    %_21 = bitcast i8* %_20 to i32 (i8 *, i32, i32)*

    ;Code snippet for performing the call 

  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: aux01
    %_22 = load i32, i32* %aux01
;---IN PRIMARY EXPRESSION END 1846---


    %_23 = call i32 %_21(i8* %this , i32 0, i32 %_22)

    store i32 %_23, i32* %aux01


    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_24 = bitcast i8* %this to i8***
    %_25 = load i8**, i8*** %_24
    %_26 = getelementptr i8*, i8** %_25, i32 2
    %_27 = load i8*, i8** %_26
    %_28 = bitcast i8* %_27 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_29 = call i32 %_28(i8* %this)

    store i32 %_29, i32* %aux01


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i32 @QS.Sort(i8* %this, i32 %.left, i32 %.right){
    %left = alloca i32
    store i32 %.left, i32* %left
    %right = alloca i32
    store i32 %.right, i32* %right
    %aux03 = alloca i32
    %cont01 = alloca i1
    %cont02 = alloca i1
    %i = alloca i32
    %j = alloca i32
    %nt = alloca i32
    %t = alloca i32
    %v = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %t


  ;primary: left
    %_0 = load i32, i32* %left
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: right
    %_1 = load i32, i32* %right
;---IN PRIMARY EXPRESSION END 1846---


    %_2 = icmp slt i32 %_0 , %_1
    br i1 %_2, label %if_then_0, label %if_else_0
    if_then_0:
    ; code snipet for assignment Statemnt
    ;code snipet for arrayLookup
  ;primary: number
    %_3 = getelementptr i8, i8* %this, i32 8
    %_4 = bitcast i8* %_3 to i32**
    %_5 = load i32*, i32** %_4
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: right
    %_6 = load i32, i32* %right
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_7 = load i32, i32* %_5
     ; Check that the index is greater than zero
    %_8 = icmp sge i32 %_6 ,0
    ;Chech that the index is less than the size of the array
    %_9 = icmp slt i32 %_6,  %_7
    %_10 = and i1 %_9, %_8
    br i1 %_10, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_11 = add i32 1, %_6
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_12 = getelementptr i32, i32* %_5 , i32 %_11
 %_13 = load i32, i32* %_12


    store i32 %_13, i32* %v


    ; code snipet for assignment Statemnt
  ;primary: left
    %_14 = load i32, i32* %left
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_15 = sub i32  1 ,  %_14


    store i32 %_15, i32* %i


    ; code snipet for assignment Statemnt
  ;primary: right
    %_16 = load i32, i32* %right
;---IN PRIMARY EXPRESSION END 1846---


    store i32 %_16, i32* %j


    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %cont01



  ;while loop
br label %whileCond_2

whileCond_2:
  ;primary: cont01
    %_17 = load i1, i1* %cont01
;---IN PRIMARY EXPRESSION END 1846---


br i1%_17, label %loop_then_2, label %loop_exit_2

loop_then_2:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %cont02



  ;while loop
br label %whileCond_3

whileCond_3:
  ;primary: cont02
    %_18 = load i1, i1* %cont02
;---IN PRIMARY EXPRESSION END 1846---


br i1%_18, label %loop_then_3, label %loop_exit_3

loop_then_3:
    ; code snipet for assignment Statemnt
  ;primary: i
    %_19 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_20 = add i32 1 ,  %_19


    store i32 %_20, i32* %i


    ; code snipet for assignment Statemnt
    ;code snipet for arrayLookup
  ;primary: number
    %_21 = getelementptr i8, i8* %this, i32 8
    %_22 = bitcast i8* %_21 to i32**
    %_23 = load i32*, i32** %_22
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: i
    %_24 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_25 = load i32, i32* %_23
     ; Check that the index is greater than zero
    %_26 = icmp sge i32 %_24 ,0
    ;Chech that the index is less than the size of the array
    %_27 = icmp slt i32 %_24,  %_25
    %_28 = and i1 %_27, %_26
    br i1 %_28, label %oob_ok_4, label %oob_err_4
    ; Else throw out of bounds exception
    oob_err_4:
    call void @throw_oob()
    br label %oob_ok_4
    ; All ok, we can safely index the array now
    oob_ok_4:
    %_29 = add i32 1, %_24
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_30 = getelementptr i32, i32* %_23 , i32 %_29
 %_31 = load i32, i32* %_30


    store i32 %_31, i32* %aux03


  ;primary: aux03
    %_32 = load i32, i32* %aux03
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: v
    %_33 = load i32, i32* %v
;---IN PRIMARY EXPRESSION END 1846---


    %_34 = icmp slt i32 %_32 , %_33
  ;primary: %_34
;---IN PRIMARY EXPRESSION END 1850---


    %_35 = xor i1 %_34 , 1
    br i1 %_35, label %if_then_5, label %if_else_5
    if_then_5:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont02


    br label %if_end_5
    if_else_5:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %cont02


    br label %if_end_5
    if_end_5:
br label %whileCond_3
loop_exit_3:


    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %cont02



  ;while loop
br label %whileCond_6

whileCond_6:
  ;primary: cont02
    %_36 = load i1, i1* %cont02
;---IN PRIMARY EXPRESSION END 1846---


br i1%_36, label %loop_then_6, label %loop_exit_6

loop_then_6:
    ; code snipet for assignment Statemnt
  ;primary: j
    %_37 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_38 = sub i32  1 ,  %_37


    store i32 %_38, i32* %j


    ; code snipet for assignment Statemnt
    ;code snipet for arrayLookup
  ;primary: number
    %_39 = getelementptr i8, i8* %this, i32 8
    %_40 = bitcast i8* %_39 to i32**
    %_41 = load i32*, i32** %_40
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: j
    %_42 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_43 = load i32, i32* %_41
     ; Check that the index is greater than zero
    %_44 = icmp sge i32 %_42 ,0
    ;Chech that the index is less than the size of the array
    %_45 = icmp slt i32 %_42,  %_43
    %_46 = and i1 %_45, %_44
    br i1 %_46, label %oob_ok_7, label %oob_err_7
    ; Else throw out of bounds exception
    oob_err_7:
    call void @throw_oob()
    br label %oob_ok_7
    ; All ok, we can safely index the array now
    oob_ok_7:
    %_47 = add i32 1, %_42
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_48 = getelementptr i32, i32* %_41 , i32 %_47
 %_49 = load i32, i32* %_48


    store i32 %_49, i32* %aux03


  ;primary: v
    %_50 = load i32, i32* %v
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: aux03
    %_51 = load i32, i32* %aux03
;---IN PRIMARY EXPRESSION END 1846---


    %_52 = icmp slt i32 %_50 , %_51
  ;primary: %_52
;---IN PRIMARY EXPRESSION END 1850---


    %_53 = xor i1 %_52 , 1
    br i1 %_53, label %if_then_8, label %if_else_8
    if_then_8:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont02


    br label %if_end_8
    if_else_8:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %cont02


    br label %if_end_8
    if_end_8:
br label %whileCond_6
loop_exit_6:


    ; code snipet for assignment Statemnt
    ;code snipet for arrayLookup
  ;primary: number
    %_54 = getelementptr i8, i8* %this, i32 8
    %_55 = bitcast i8* %_54 to i32**
    %_56 = load i32*, i32** %_55
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: i
    %_57 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_58 = load i32, i32* %_56
     ; Check that the index is greater than zero
    %_59 = icmp sge i32 %_57 ,0
    ;Chech that the index is less than the size of the array
    %_60 = icmp slt i32 %_57,  %_58
    %_61 = and i1 %_60, %_59
    br i1 %_61, label %oob_ok_9, label %oob_err_9
    ; Else throw out of bounds exception
    oob_err_9:
    call void @throw_oob()
    br label %oob_ok_9
    ; All ok, we can safely index the array now
    oob_ok_9:
    %_62 = add i32 1, %_57
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_63 = getelementptr i32, i32* %_56 , i32 %_62
 %_64 = load i32, i32* %_63


    store i32 %_64, i32* %t


    ;code snipet for ArrayAssignmentStatement
    %_65 = getelementptr i8, i8* %this, i32 8
    %_66 = bitcast i8* %_65 to i32**
  ;primary: i
    %_67 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    ;code snipet for arrayLookup
  ;primary: number
    %_68 = getelementptr i8, i8* %this, i32 8
    %_69 = bitcast i8* %_68 to i32**
    %_70 = load i32*, i32** %_69
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: j
    %_71 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_72 = load i32, i32* %_70
     ; Check that the index is greater than zero
    %_73 = icmp sge i32 %_71 ,0
    ;Chech that the index is less than the size of the array
    %_74 = icmp slt i32 %_71,  %_72
    %_75 = and i1 %_74, %_73
    br i1 %_75, label %oob_ok_10, label %oob_err_10
    ; Else throw out of bounds exception
    oob_err_10:
    call void @throw_oob()
    br label %oob_ok_10
    ; All ok, we can safely index the array now
    oob_ok_10:
    %_76 = add i32 1, %_71
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_77 = getelementptr i32, i32* %_70 , i32 %_76
 %_78 = load i32, i32* %_77


    ;Load the address of the %_66 array
    %_79 = load i32*, i32** %_66
    ; Load the size of the array (first integer of the array)
    %_80 = load i32, i32* %_79
     ; Check that the index is greater than zero
    %_81 = icmp sge i32 %_67 ,0
    ;Chech that the index is less than the size of the array
    %_82 = icmp slt i32 %_67,  %_80
    %_83 = and i1 %_82, %_81
    br i1 %_83, label %oob_ok_11, label %oob_err_11
    ; Else throw out of bounds exception
    oob_err_11:
    call void @throw_oob()
    br label %oob_ok_11
    ; All ok, we can safely index the array now
    oob_ok_11:
    %_84 = add i32 1, %_67
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_85 = getelementptr i32, i32* %_79 , i32 %_84
     ; And store value to that address *%_79 = value
    store i32 %_78, i32* %_85


    ;code snipet for ArrayAssignmentStatement
    %_86 = getelementptr i8, i8* %this, i32 8
    %_87 = bitcast i8* %_86 to i32**
  ;primary: j
    %_88 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: t
    %_89 = load i32, i32* %t
;---IN PRIMARY EXPRESSION END 1846---


    ;Load the address of the %_87 array
    %_90 = load i32*, i32** %_87
    ; Load the size of the array (first integer of the array)
    %_91 = load i32, i32* %_90
     ; Check that the index is greater than zero
    %_92 = icmp sge i32 %_88 ,0
    ;Chech that the index is less than the size of the array
    %_93 = icmp slt i32 %_88,  %_91
    %_94 = and i1 %_93, %_92
    br i1 %_94, label %oob_ok_12, label %oob_err_12
    ; Else throw out of bounds exception
    oob_err_12:
    call void @throw_oob()
    br label %oob_ok_12
    ; All ok, we can safely index the array now
    oob_ok_12:
    %_95 = add i32 1, %_88
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_96 = getelementptr i32, i32* %_90 , i32 %_95
     ; And store value to that address *%_90 = value
    store i32 %_89, i32* %_96


  ;primary: j
    %_97 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_98 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_99 = add i32 1 ,  %_98


  ;primary: %_99
;---IN PRIMARY EXPRESSION END 1850---


    %_100 = icmp slt i32 %_97 , %_99
    br i1 %_100, label %if_then_13, label %if_else_13
    if_then_13:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %cont01


    br label %if_end_13
    if_else_13:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %cont01


    br label %if_end_13
    if_end_13:
br label %whileCond_2
loop_exit_2:


    ;code snipet for ArrayAssignmentStatement
    %_101 = getelementptr i8, i8* %this, i32 8
    %_102 = bitcast i8* %_101 to i32**
  ;primary: j
    %_103 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


    ;code snipet for arrayLookup
  ;primary: number
    %_104 = getelementptr i8, i8* %this, i32 8
    %_105 = bitcast i8* %_104 to i32**
    %_106 = load i32*, i32** %_105
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: i
    %_107 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_108 = load i32, i32* %_106
     ; Check that the index is greater than zero
    %_109 = icmp sge i32 %_107 ,0
    ;Chech that the index is less than the size of the array
    %_110 = icmp slt i32 %_107,  %_108
    %_111 = and i1 %_110, %_109
    br i1 %_111, label %oob_ok_14, label %oob_err_14
    ; Else throw out of bounds exception
    oob_err_14:
    call void @throw_oob()
    br label %oob_ok_14
    ; All ok, we can safely index the array now
    oob_ok_14:
    %_112 = add i32 1, %_107
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_113 = getelementptr i32, i32* %_106 , i32 %_112
 %_114 = load i32, i32* %_113


    ;Load the address of the %_102 array
    %_115 = load i32*, i32** %_102
    ; Load the size of the array (first integer of the array)
    %_116 = load i32, i32* %_115
     ; Check that the index is greater than zero
    %_117 = icmp sge i32 %_103 ,0
    ;Chech that the index is less than the size of the array
    %_118 = icmp slt i32 %_103,  %_116
    %_119 = and i1 %_118, %_117
    br i1 %_119, label %oob_ok_15, label %oob_err_15
    ; Else throw out of bounds exception
    oob_err_15:
    call void @throw_oob()
    br label %oob_ok_15
    ; All ok, we can safely index the array now
    oob_ok_15:
    %_120 = add i32 1, %_103
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_121 = getelementptr i32, i32* %_115 , i32 %_120
     ; And store value to that address *%_115 = value
    store i32 %_114, i32* %_121


    ;code snipet for ArrayAssignmentStatement
    %_122 = getelementptr i8, i8* %this, i32 8
    %_123 = bitcast i8* %_122 to i32**
  ;primary: i
    %_124 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    ;code snipet for arrayLookup
  ;primary: number
    %_125 = getelementptr i8, i8* %this, i32 8
    %_126 = bitcast i8* %_125 to i32**
    %_127 = load i32*, i32** %_126
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: right
    %_128 = load i32, i32* %right
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_129 = load i32, i32* %_127
     ; Check that the index is greater than zero
    %_130 = icmp sge i32 %_128 ,0
    ;Chech that the index is less than the size of the array
    %_131 = icmp slt i32 %_128,  %_129
    %_132 = and i1 %_131, %_130
    br i1 %_132, label %oob_ok_16, label %oob_err_16
    ; Else throw out of bounds exception
    oob_err_16:
    call void @throw_oob()
    br label %oob_ok_16
    ; All ok, we can safely index the array now
    oob_ok_16:
    %_133 = add i32 1, %_128
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_134 = getelementptr i32, i32* %_127 , i32 %_133
 %_135 = load i32, i32* %_134


    ;Load the address of the %_123 array
    %_136 = load i32*, i32** %_123
    ; Load the size of the array (first integer of the array)
    %_137 = load i32, i32* %_136
     ; Check that the index is greater than zero
    %_138 = icmp sge i32 %_124 ,0
    ;Chech that the index is less than the size of the array
    %_139 = icmp slt i32 %_124,  %_137
    %_140 = and i1 %_139, %_138
    br i1 %_140, label %oob_ok_17, label %oob_err_17
    ; Else throw out of bounds exception
    oob_err_17:
    call void @throw_oob()
    br label %oob_ok_17
    ; All ok, we can safely index the array now
    oob_ok_17:
    %_141 = add i32 1, %_124
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_142 = getelementptr i32, i32* %_136 , i32 %_141
     ; And store value to that address *%_136 = value
    store i32 %_135, i32* %_142


    ;code snipet for ArrayAssignmentStatement
    %_143 = getelementptr i8, i8* %this, i32 8
    %_144 = bitcast i8* %_143 to i32**
  ;primary: right
    %_145 = load i32, i32* %right
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: t
    %_146 = load i32, i32* %t
;---IN PRIMARY EXPRESSION END 1846---


    ;Load the address of the %_144 array
    %_147 = load i32*, i32** %_144
    ; Load the size of the array (first integer of the array)
    %_148 = load i32, i32* %_147
     ; Check that the index is greater than zero
    %_149 = icmp sge i32 %_145 ,0
    ;Chech that the index is less than the size of the array
    %_150 = icmp slt i32 %_145,  %_148
    %_151 = and i1 %_150, %_149
    br i1 %_151, label %oob_ok_18, label %oob_err_18
    ; Else throw out of bounds exception
    oob_err_18:
    call void @throw_oob()
    br label %oob_ok_18
    ; All ok, we can safely index the array now
    oob_ok_18:
    %_152 = add i32 1, %_145
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_153 = getelementptr i32, i32* %_147 , i32 %_152
     ; And store value to that address *%_147 = value
    store i32 %_146, i32* %_153


    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_154 = bitcast i8* %this to i8***
    %_155 = load i8**, i8*** %_154
    %_156 = getelementptr i8*, i8** %_155, i32 1
    %_157 = load i8*, i8** %_156
    %_158 = bitcast i8* %_157 to i32 (i8 *, i32, i32)*

    ;Code snippet for performing the call 

  ;primary: left
    %_159 = load i32, i32* %left
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_160 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_161 = sub i32  1 ,  %_160


    %_162 = call i32 %_158(i8* %this , i32 %_159, i32 %_161)

    store i32 %_162, i32* %nt


    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_163 = bitcast i8* %this to i8***
    %_164 = load i8**, i8*** %_163
    %_165 = getelementptr i8*, i8** %_164, i32 1
    %_166 = load i8*, i8** %_165
    %_167 = bitcast i8* %_166 to i32 (i8 *, i32, i32)*

    ;Code snippet for performing the call 

  ;primary: i
    %_168 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_169 = add i32 1 ,  %_168


  ;primary: right
    %_170 = load i32, i32* %right
;---IN PRIMARY EXPRESSION END 1846---


    %_171 = call i32 %_167(i8* %this , i32 %_169, i32 %_170)

    store i32 %_171, i32* %nt


    br label %if_end_0
    if_else_0:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nt


    br label %if_end_0
    if_end_0:
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i32 @QS.Print(i8* %this){
    %j = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %j



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: j
    %_0 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: size
    %_1 = getelementptr i8, i8* %this, i32 16
    %_2 = bitcast i8* %_1 to i32*
    %_3 = load i32, i32* %_2
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: %_3
;---IN PRIMARY EXPRESSION END 1850---


    %_4 = icmp slt i32 %_0 , %_3
br i1%_4, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ;code snipet for printing
    ;code snipet for arrayLookup
  ;primary: number
    %_5 = getelementptr i8, i8* %this, i32 8
    %_6 = bitcast i8* %_5 to i32**
    %_7 = load i32*, i32** %_6
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: j
    %_8 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_9 = load i32, i32* %_7
     ; Check that the index is greater than zero
    %_10 = icmp sge i32 %_8 ,0
    ;Chech that the index is less than the size of the array
    %_11 = icmp slt i32 %_8,  %_9
    %_12 = and i1 %_11, %_10
    br i1 %_12, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_13 = add i32 1, %_8
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_14 = getelementptr i32, i32* %_7 , i32 %_13
 %_15 = load i32, i32* %_14


    call void (i32) @print_int(i32 %_15)
    ; code snipet for assignment Statemnt
  ;primary: j
    %_16 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_17 = add i32 1 ,  %_16


    store i32 %_17, i32* %j


br label %whileCond_0
loop_exit_0:


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i32 @QS.Init(i8* %this, i32 %.sz){
    %sz = alloca i32
    store i32 %.sz, i32* %sz
    ; code snipet for assignment Statemnt
  ;primary: sz
    %_0 = load i32, i32* %sz
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 16
    %_2 = bitcast i8* %_1 to i32*
    store i32 %_0, i32* %_2


    ; code snipet for assignment Statemnt
    ; code snipet for array allocation! 
  ;primary: sz
    %_3 = load i32, i32* %sz
;---IN PRIMARY EXPRESSION END 1846---


    %_4 = add i32 1 , %_3
    ; Check that the size of the array is not negative - since we added 1, we just check
    ; that the size is >= 1.
    %_5 = icmp sge i32 %_4 , 1
    br i1 %_5 , label %sizeIsNotNeg_0, label %sizeIsNeg_0
    ; Size was negative, throw negative size exception
    sizeIsNeg_0:
    call void @throw_nsz()
    br label %sizeIsNotNeg_0
    ; All ok, we can proceed with the allocation
    sizeIsNotNeg_0:
    ; Allocate sz + 1 integers (4 bytes each)
    %_6 = call i8* @calloc( i32 %_4, i32 4)
    ; Cast the returned pointer
    %_7 = bitcast i8* %_6 to i32*
    ; Store the size of the array in the first position of the array
    store i32 %_3, i32* %_7


  ;primary: %_7
;---IN PRIMARY EXPRESSION END 1850---


    %_8 = getelementptr i8, i8* %this, i32 8
    %_9 = bitcast i8* %_8 to i32**
    store i32* %_7, i32** %_9


    ;code snipet for ArrayAssignmentStatement
    %_10 = getelementptr i8, i8* %this, i32 8
    %_11 = bitcast i8* %_10 to i32**
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 20
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_11 array
    %_12 = load i32*, i32** %_11
    ; Load the size of the array (first integer of the array)
    %_13 = load i32, i32* %_12
     ; Check that the index is greater than zero
    %_14 = icmp sge i32 0 ,0
    ;Chech that the index is less than the size of the array
    %_15 = icmp slt i32 0,  %_13
    %_16 = and i1 %_15, %_14
    br i1 %_16, label %oob_ok_0, label %oob_err_0
    ; Else throw out of bounds exception
    oob_err_0:
    call void @throw_oob()
    br label %oob_ok_0
    ; All ok, we can safely index the array now
    oob_ok_0:
    %_17 = add i32 1, 0
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_18 = getelementptr i32, i32* %_12 , i32 %_17
     ; And store value to that address *%_12 = value
    store i32 20, i32* %_18


    ;code snipet for ArrayAssignmentStatement
    %_19 = getelementptr i8, i8* %this, i32 8
    %_20 = bitcast i8* %_19 to i32**
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 7
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_20 array
    %_21 = load i32*, i32** %_20
    ; Load the size of the array (first integer of the array)
    %_22 = load i32, i32* %_21
     ; Check that the index is greater than zero
    %_23 = icmp sge i32 1 ,0
    ;Chech that the index is less than the size of the array
    %_24 = icmp slt i32 1,  %_22
    %_25 = and i1 %_24, %_23
    br i1 %_25, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_26 = add i32 1, 1
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_27 = getelementptr i32, i32* %_21 , i32 %_26
     ; And store value to that address *%_21 = value
    store i32 7, i32* %_27


    ;code snipet for ArrayAssignmentStatement
    %_28 = getelementptr i8, i8* %this, i32 8
    %_29 = bitcast i8* %_28 to i32**
  ;primary: 2
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 12
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_29 array
    %_30 = load i32*, i32** %_29
    ; Load the size of the array (first integer of the array)
    %_31 = load i32, i32* %_30
     ; Check that the index is greater than zero
    %_32 = icmp sge i32 2 ,0
    ;Chech that the index is less than the size of the array
    %_33 = icmp slt i32 2,  %_31
    %_34 = and i1 %_33, %_32
    br i1 %_34, label %oob_ok_2, label %oob_err_2
    ; Else throw out of bounds exception
    oob_err_2:
    call void @throw_oob()
    br label %oob_ok_2
    ; All ok, we can safely index the array now
    oob_ok_2:
    %_35 = add i32 1, 2
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_36 = getelementptr i32, i32* %_30 , i32 %_35
     ; And store value to that address *%_30 = value
    store i32 12, i32* %_36


    ;code snipet for ArrayAssignmentStatement
    %_37 = getelementptr i8, i8* %this, i32 8
    %_38 = bitcast i8* %_37 to i32**
  ;primary: 3
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 18
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_38 array
    %_39 = load i32*, i32** %_38
    ; Load the size of the array (first integer of the array)
    %_40 = load i32, i32* %_39
     ; Check that the index is greater than zero
    %_41 = icmp sge i32 3 ,0
    ;Chech that the index is less than the size of the array
    %_42 = icmp slt i32 3,  %_40
    %_43 = and i1 %_42, %_41
    br i1 %_43, label %oob_ok_3, label %oob_err_3
    ; Else throw out of bounds exception
    oob_err_3:
    call void @throw_oob()
    br label %oob_ok_3
    ; All ok, we can safely index the array now
    oob_ok_3:
    %_44 = add i32 1, 3
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_45 = getelementptr i32, i32* %_39 , i32 %_44
     ; And store value to that address *%_39 = value
    store i32 18, i32* %_45


    ;code snipet for ArrayAssignmentStatement
    %_46 = getelementptr i8, i8* %this, i32 8
    %_47 = bitcast i8* %_46 to i32**
  ;primary: 4
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 2
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_47 array
    %_48 = load i32*, i32** %_47
    ; Load the size of the array (first integer of the array)
    %_49 = load i32, i32* %_48
     ; Check that the index is greater than zero
    %_50 = icmp sge i32 4 ,0
    ;Chech that the index is less than the size of the array
    %_51 = icmp slt i32 4,  %_49
    %_52 = and i1 %_51, %_50
    br i1 %_52, label %oob_ok_4, label %oob_err_4
    ; Else throw out of bounds exception
    oob_err_4:
    call void @throw_oob()
    br label %oob_ok_4
    ; All ok, we can safely index the array now
    oob_ok_4:
    %_53 = add i32 1, 4
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_54 = getelementptr i32, i32* %_48 , i32 %_53
     ; And store value to that address *%_48 = value
    store i32 2, i32* %_54


    ;code snipet for ArrayAssignmentStatement
    %_55 = getelementptr i8, i8* %this, i32 8
    %_56 = bitcast i8* %_55 to i32**
  ;primary: 5
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 11
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_56 array
    %_57 = load i32*, i32** %_56
    ; Load the size of the array (first integer of the array)
    %_58 = load i32, i32* %_57
     ; Check that the index is greater than zero
    %_59 = icmp sge i32 5 ,0
    ;Chech that the index is less than the size of the array
    %_60 = icmp slt i32 5,  %_58
    %_61 = and i1 %_60, %_59
    br i1 %_61, label %oob_ok_5, label %oob_err_5
    ; Else throw out of bounds exception
    oob_err_5:
    call void @throw_oob()
    br label %oob_ok_5
    ; All ok, we can safely index the array now
    oob_ok_5:
    %_62 = add i32 1, 5
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_63 = getelementptr i32, i32* %_57 , i32 %_62
     ; And store value to that address *%_57 = value
    store i32 11, i32* %_63


    ;code snipet for ArrayAssignmentStatement
    %_64 = getelementptr i8, i8* %this, i32 8
    %_65 = bitcast i8* %_64 to i32**
  ;primary: 6
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 6
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_65 array
    %_66 = load i32*, i32** %_65
    ; Load the size of the array (first integer of the array)
    %_67 = load i32, i32* %_66
     ; Check that the index is greater than zero
    %_68 = icmp sge i32 6 ,0
    ;Chech that the index is less than the size of the array
    %_69 = icmp slt i32 6,  %_67
    %_70 = and i1 %_69, %_68
    br i1 %_70, label %oob_ok_6, label %oob_err_6
    ; Else throw out of bounds exception
    oob_err_6:
    call void @throw_oob()
    br label %oob_ok_6
    ; All ok, we can safely index the array now
    oob_ok_6:
    %_71 = add i32 1, 6
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_72 = getelementptr i32, i32* %_66 , i32 %_71
     ; And store value to that address *%_66 = value
    store i32 6, i32* %_72


    ;code snipet for ArrayAssignmentStatement
    %_73 = getelementptr i8, i8* %this, i32 8
    %_74 = bitcast i8* %_73 to i32**
  ;primary: 7
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 9
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_74 array
    %_75 = load i32*, i32** %_74
    ; Load the size of the array (first integer of the array)
    %_76 = load i32, i32* %_75
     ; Check that the index is greater than zero
    %_77 = icmp sge i32 7 ,0
    ;Chech that the index is less than the size of the array
    %_78 = icmp slt i32 7,  %_76
    %_79 = and i1 %_78, %_77
    br i1 %_79, label %oob_ok_7, label %oob_err_7
    ; Else throw out of bounds exception
    oob_err_7:
    call void @throw_oob()
    br label %oob_ok_7
    ; All ok, we can safely index the array now
    oob_ok_7:
    %_80 = add i32 1, 7
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_81 = getelementptr i32, i32* %_75 , i32 %_80
     ; And store value to that address *%_75 = value
    store i32 9, i32* %_81


    ;code snipet for ArrayAssignmentStatement
    %_82 = getelementptr i8, i8* %this, i32 8
    %_83 = bitcast i8* %_82 to i32**
  ;primary: 8
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 19
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_83 array
    %_84 = load i32*, i32** %_83
    ; Load the size of the array (first integer of the array)
    %_85 = load i32, i32* %_84
     ; Check that the index is greater than zero
    %_86 = icmp sge i32 8 ,0
    ;Chech that the index is less than the size of the array
    %_87 = icmp slt i32 8,  %_85
    %_88 = and i1 %_87, %_86
    br i1 %_88, label %oob_ok_8, label %oob_err_8
    ; Else throw out of bounds exception
    oob_err_8:
    call void @throw_oob()
    br label %oob_ok_8
    ; All ok, we can safely index the array now
    oob_ok_8:
    %_89 = add i32 1, 8
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_90 = getelementptr i32, i32* %_84 , i32 %_89
     ; And store value to that address *%_84 = value
    store i32 19, i32* %_90


    ;code snipet for ArrayAssignmentStatement
    %_91 = getelementptr i8, i8* %this, i32 8
    %_92 = bitcast i8* %_91 to i32**
  ;primary: 9
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 5
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_92 array
    %_93 = load i32*, i32** %_92
    ; Load the size of the array (first integer of the array)
    %_94 = load i32, i32* %_93
     ; Check that the index is greater than zero
    %_95 = icmp sge i32 9 ,0
    ;Chech that the index is less than the size of the array
    %_96 = icmp slt i32 9,  %_94
    %_97 = and i1 %_96, %_95
    br i1 %_97, label %oob_ok_9, label %oob_err_9
    ; Else throw out of bounds exception
    oob_err_9:
    call void @throw_oob()
    br label %oob_ok_9
    ; All ok, we can safely index the array now
    oob_ok_9:
    %_98 = add i32 1, 9
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_99 = getelementptr i32, i32* %_93 , i32 %_98
     ; And store value to that address *%_93 = value
    store i32 5, i32* %_99


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
