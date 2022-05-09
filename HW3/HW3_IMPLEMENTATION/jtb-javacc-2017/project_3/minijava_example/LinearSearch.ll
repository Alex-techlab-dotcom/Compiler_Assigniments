

@.LS_vtable=global[4 x i8*] [
	i8 * bitcast(i32(i8 *, i32) * @LS.Start to i8 *),
	i8 * bitcast(i32(i8 *) * @LS.Print to i8 *),
	i8 * bitcast(i32(i8 *, i32) * @LS.Search to i8 *),
	i8 * bitcast(i32(i8 *, i32) * @LS.Init to i8 *)
]
@.LinearSearch_vtable=global[0 x i8*] []
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
    %_2 = getelementptr [4 x i8*], [4 x i8*]* @.LS_vtable, i32 0, i32 0
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
define i32 @LS.Start(i8* %this, i32 %.sz){
    %sz = alloca i32
    store i32 %.sz, i32* %sz
    %aux01 = alloca i32
    %aux02 = alloca i32
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
    %_9 = getelementptr i8*, i8** %_8, i32 1
    %_10 = load i8*, i8** %_9
    %_11 = bitcast i8* %_10 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_12 = call i32 %_11(i8* %this)

    store i32 %_12, i32* %aux02


    ;code snipet for printing
  ;primary: 9999
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 9999)
    ;code snipet for printing
  ;primary: this

   ;Code snippet for MessageSend

    %_13 = bitcast i8* %this to i8***
    %_14 = load i8**, i8*** %_13
    %_15 = getelementptr i8*, i8** %_14, i32 2
    %_16 = load i8*, i8** %_15
    %_17 = bitcast i8* %_16 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 8
;---IN PRIMARY EXPRESSION END 1850---


    %_18 = call i32 %_17(i8* %this , i32 8)

    call void (i32) @print_int(i32 %_18)
    ;code snipet for printing
  ;primary: this

   ;Code snippet for MessageSend

    %_19 = bitcast i8* %this to i8***
    %_20 = load i8**, i8*** %_19
    %_21 = getelementptr i8*, i8** %_20, i32 2
    %_22 = load i8*, i8** %_21
    %_23 = bitcast i8* %_22 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 12
;---IN PRIMARY EXPRESSION END 1850---


    %_24 = call i32 %_23(i8* %this , i32 12)

    call void (i32) @print_int(i32 %_24)
    ;code snipet for printing
  ;primary: this

   ;Code snippet for MessageSend

    %_25 = bitcast i8* %this to i8***
    %_26 = load i8**, i8*** %_25
    %_27 = getelementptr i8*, i8** %_26, i32 2
    %_28 = load i8*, i8** %_27
    %_29 = bitcast i8* %_28 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 17
;---IN PRIMARY EXPRESSION END 1850---


    %_30 = call i32 %_29(i8* %this , i32 17)

    call void (i32) @print_int(i32 %_30)
    ;code snipet for printing
  ;primary: this

   ;Code snippet for MessageSend

    %_31 = bitcast i8* %this to i8***
    %_32 = load i8**, i8*** %_31
    %_33 = getelementptr i8*, i8** %_32, i32 2
    %_34 = load i8*, i8** %_33
    %_35 = bitcast i8* %_34 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 50
;---IN PRIMARY EXPRESSION END 1850---


    %_36 = call i32 %_35(i8* %this , i32 50)

    call void (i32) @print_int(i32 %_36)
  ;primary: 55
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 55
}
define i32 @LS.Print(i8* %this){
    %j = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    store i32 1, i32* %j



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
define i32 @LS.Search(i8* %this, i32 %.num){
    %num = alloca i32
    store i32 %.num, i32* %num
    %aux01 = alloca i32
    %aux02 = alloca i32
    %ifound = alloca i32
    %j = alloca i32
    %ls01 = alloca i1
    %nt = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    store i32 1, i32* %j


    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %ls01


    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %ifound



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
    ; code snipet for assignment Statemnt
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


    store i32 %_15, i32* %aux01


    ; code snipet for assignment Statemnt
  ;primary: num
    %_16 = load i32, i32* %num
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_17 = add i32 1 ,  %_16


    store i32 %_17, i32* %aux02


  ;primary: aux01
    %_18 = load i32, i32* %aux01
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: num
    %_19 = load i32, i32* %num
;---IN PRIMARY EXPRESSION END 1846---


    %_20 = icmp slt i32 %_18 , %_19
    br i1 %_20, label %if_then_2, label %if_else_2
    if_then_2:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nt


    br label %if_end_2
    if_else_2:
  ;primary: aux01
    %_21 = load i32, i32* %aux01
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: aux02
    %_22 = load i32, i32* %aux02
;---IN PRIMARY EXPRESSION END 1846---


    %_23 = icmp slt i32 %_21 , %_22
  ;primary: %_23
;---IN PRIMARY EXPRESSION END 1850---


    %_24 = xor i1 %_23 , 1
    br i1 %_24, label %if_then_3, label %if_else_3
    if_then_3:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nt


    br label %if_end_3
    if_else_3:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %ls01


    ; code snipet for assignment Statemnt
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    store i32 1, i32* %ifound


    ; code snipet for assignment Statemnt
  ;primary: size
    %_25 = getelementptr i8, i8* %this, i32 16
    %_26 = bitcast i8* %_25 to i32*
    %_27 = load i32, i32* %_26
;---IN PRIMARY EXPRESSION END 1838 ---


    store i32 %_27, i32* %j


    br label %if_end_3
    if_end_3:
    br label %if_end_2
    if_end_2:
    ; code snipet for assignment Statemnt
  ;primary: j
    %_28 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_29 = add i32 1 ,  %_28


    store i32 %_29, i32* %j


br label %whileCond_0
loop_exit_0:


  ;primary: ifound
    %_30 = load i32, i32* %ifound
;---IN PRIMARY EXPRESSION END 1846---


    ret i32 %_30
}
define i32 @LS.Init(i8* %this, i32 %.sz){
    %sz = alloca i32
    store i32 %.sz, i32* %sz
    %aux01 = alloca i32
    %aux02 = alloca i32
    %j = alloca i32
    %k = alloca i32
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


    ; code snipet for assignment Statemnt
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    store i32 1, i32* %j


    ; code snipet for assignment Statemnt
  ;primary: size
    %_10 = getelementptr i8, i8* %this, i32 16
    %_11 = bitcast i8* %_10 to i32*
    %_12 = load i32, i32* %_11
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_13 = add i32 1 ,  %_12


    store i32 %_13, i32* %k



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: j
    %_14 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: size
    %_15 = getelementptr i8, i8* %this, i32 16
    %_16 = bitcast i8* %_15 to i32*
    %_17 = load i32, i32* %_16
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: %_17
;---IN PRIMARY EXPRESSION END 1850---


    %_18 = icmp slt i32 %_14 , %_17
br i1%_18, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ; code snipet for assignment Statemnt
  ;primary: 2
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: j
    %_19 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


    %_20 = mul i32 %_19 ,  2


    store i32 %_20, i32* %aux01


    ; code snipet for assignment Statemnt
  ;primary: k
    %_21 = load i32, i32* %k
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 3
;---IN PRIMARY EXPRESSION END 1850---


    %_22 = sub i32  3 ,  %_21


    store i32 %_22, i32* %aux02


    ;code snipet for ArrayAssignmentStatement
    %_23 = getelementptr i8, i8* %this, i32 8
    %_24 = bitcast i8* %_23 to i32**
  ;primary: j
    %_25 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: aux01
    %_26 = load i32, i32* %aux01
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: aux02
    %_27 = load i32, i32* %aux02
;---IN PRIMARY EXPRESSION END 1846---


    %_28 = add i32 %_27 ,  %_26


    ;Load the address of the %_24 array
    %_29 = load i32*, i32** %_24
    ; Load the size of the array (first integer of the array)
    %_30 = load i32, i32* %_29
     ; Check that the index is greater than zero
    %_31 = icmp sge i32 %_25 ,0
    ;Chech that the index is less than the size of the array
    %_32 = icmp slt i32 %_25,  %_30
    %_33 = and i1 %_32, %_31
    br i1 %_33, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_34 = add i32 1, %_25
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_35 = getelementptr i32, i32* %_29 , i32 %_34
     ; And store value to that address *%_29 = value
    store i32 %_28, i32* %_35


    ; code snipet for assignment Statemnt
  ;primary: j
    %_36 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_37 = add i32 1 ,  %_36


    store i32 %_37, i32* %j


    ; code snipet for assignment Statemnt
  ;primary: k
    %_38 = load i32, i32* %k
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_39 = sub i32  1 ,  %_38


    store i32 %_39, i32* %k


br label %whileCond_0
loop_exit_0:


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
