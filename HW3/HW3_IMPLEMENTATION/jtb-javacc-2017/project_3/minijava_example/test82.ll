

@.Test_vtable=global[2 x i8*] [
	i8 * bitcast(i32(i8 *) * @Test.start to i8 *),
	i8 * bitcast(i1(i8 *) * @Test.next to i8 *)
]
@.test82_vtable=global[0 x i8*] []
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
    %_0 = call i8* @calloc(i32 1, i32 17)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [2 x i8*], [2 x i8*]* @.Test_vtable, i32 0, i32 0
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
define i32 @Test.start(i8* %this){
    ; code snipet for assignment Statemnt
    %_0 = call i8* @calloc(i32 1, i32 17)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [2 x i8*], [2 x i8*]* @.Test_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---


    %_3 = getelementptr i8, i8* %this, i32 8
    %_4 = bitcast i8* %_3 to i8**
    store i8 * %_0, i8 ** %_4


    ; code snipet for assignment Statemnt
  ;primary: test
    %_5 = getelementptr i8, i8* %this, i32 8
    %_6 = bitcast i8* %_5 to i8**
    %_7 = load i8*, i8** %_6
;---IN PRIMARY EXPRESSION END 1838 ---



   ;Code snippet for MessageSend

    %_8 = bitcast i8* %_7 to i8***
    %_9 = load i8**, i8*** %_8
    %_10 = getelementptr i8*, i8** %_9, i32 1
    %_11 = load i8*, i8** %_10
    %_12 = bitcast i8* %_11 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_13 = call i1 %_12(i8* %_7)

    %_14 = getelementptr i8, i8* %this, i32 16
    %_15 = bitcast i8* %_14 to i1*
    store i1 %_13, i1* %_15


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i1 @Test.next(i8* %this){
    %b2 = alloca i1
    ; code snipet for assignment Statemnt
 ; Check result, short circuit if false
 ; Check result, short circuit if false
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    br i1 true, label %exp_res_41, label %exp_res_4
    exp_res_4:
    br label %exp_res_43

    exp_res_41:
  ;primary: 7
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 8
;---IN PRIMARY EXPRESSION END 1850---


    %_0 = icmp slt i32 7 , 8
  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---


    br label %exp_res_42

   exp_res_42:
    br label %exp_res_43

      exp_res_43:
    %_1 = phi i1  [ 0, %exp_res_4 ], [ %_0, %exp_res_42 ]
  ;primary: %_1
;---IN PRIMARY EXPRESSION END 1850---


    br i1 %_1, label %exp_res_01, label %exp_res_0
    exp_res_0:
    br label %exp_res_03

    exp_res_01:
  ;primary: b
    %_2 = getelementptr i8, i8* %this, i32 16
    %_3 = bitcast i8* %_2 to i1*
    %_4 = load i1, i1* %_3
;---IN PRIMARY EXPRESSION END 1838 ---


    %_5 = xor i1 %_4 , 1
    br label %exp_res_02

   exp_res_02:
    br label %exp_res_03

      exp_res_03:
    %_6 = phi i1  [ 0, %exp_res_0 ], [ %_5, %exp_res_02 ]
  ;primary: %_6
;---IN PRIMARY EXPRESSION END 1850---


    store i1 %_6, i1* %b2


  ;primary: b2
    %_7 = load i1, i1* %b2
;---IN PRIMARY EXPRESSION END 1846---


    ret i1 %_7
}
