

@.Test_vtable=global[3 x i8*] [
	i8 * bitcast(i32(i8 *) * @Test.start to i8 *),
	i8 * bitcast(i8 *(i8 *, i8 *) * @Test.first to i8 *),
	i8 * bitcast(i32(i8 *) * @Test.second to i8 *)
]
@.test17_vtable=global[0 x i8*] []
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
    %_0 = call i8* @calloc(i32 1, i32 12)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [3 x i8*], [3 x i8*]* @.Test_vtable, i32 0, i32 0
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
    %test = alloca i8*
    ; code snipet for assignment Statemnt
    %_0 = call i8* @calloc(i32 1, i32 12)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [3 x i8*], [3 x i8*]* @.Test_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_0, i8 ** %test


    ; code snipet for assignment Statemnt
  ;primary: 10
;---IN PRIMARY EXPRESSION END 1850---


    %_3 = getelementptr i8, i8* %this, i32 8
    %_4 = bitcast i8* %_3 to i32*
    store i32 10, i32* %_4


    ; code snipet for assignment Statemnt
  ;primary: i
    %_5 = getelementptr i8, i8* %this, i32 8
    %_6 = bitcast i8* %_5 to i32*
    %_7 = load i32, i32* %_6
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: test
    %_8 = load i8*, i8** %test
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_9 = bitcast i8* %_8 to i8***
    %_10 = load i8**, i8*** %_9
    %_11 = getelementptr i8*, i8** %_10, i32 1
    %_12 = load i8*, i8** %_11
    %_13 = bitcast i8* %_12 to i8* (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: this
    %_14 = call i8* %_13(i8* %_8 , i8* %this)

  ;primary: %_14
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_15 = bitcast i8* %_14 to i8***
    %_16 = load i8**, i8*** %_15
    %_17 = getelementptr i8*, i8** %_16, i32 2
    %_18 = load i8*, i8** %_17
    %_19 = bitcast i8* %_18 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_20 = call i32 %_19(i8* %_14)

  ;primary: %_20
;---IN PRIMARY EXPRESSION END 1850---


    %_21 = add i32 %_20 ,  %_7


    %_22 = getelementptr i8, i8* %this, i32 8
    %_23 = bitcast i8* %_22 to i32*
    store i32 %_21, i32* %_23


  ;primary: i
    %_24 = getelementptr i8, i8* %this, i32 8
    %_25 = bitcast i8* %_24 to i32*
    %_26 = load i32, i32* %_25
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i32 %_26
}
define i8* @Test.first(i8* %this, i8* %.test2){
    %test2 = alloca i8*
    store i8* %.test2, i8** %test2
    %test3 = alloca i8*
    ; code snipet for assignment Statemnt
  ;primary: test2
    %_0 = load i8*, i8** %test2
;---IN PRIMARY EXPRESSION END 1846---


    store i8* %_0, i8** %test3


  ;primary: test3
    %_1 = load i8*, i8** %test3
;---IN PRIMARY EXPRESSION END 1846---


    ret i8* %_1
}
define i32 @Test.second(i8* %this){
    ; code snipet for assignment Statemnt
  ;primary: i
    %_0 = getelementptr i8, i8* %this, i32 8
    %_1 = bitcast i8* %_0 to i32*
    %_2 = load i32, i32* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: 10
;---IN PRIMARY EXPRESSION END 1850---


    %_3 = add i32 10 ,  %_2


    %_4 = getelementptr i8, i8* %this, i32 8
    %_5 = bitcast i8* %_4 to i32*
    store i32 %_3, i32* %_5


  ;primary: i
    %_6 = getelementptr i8, i8* %this, i32 8
    %_7 = bitcast i8* %_6 to i32*
    %_8 = load i32, i32* %_7
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i32 %_8
}
