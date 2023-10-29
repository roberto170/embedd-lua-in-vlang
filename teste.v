#flag -Ic:\lua\source   //path to lua.h and lauxlib.h
#flag -Lc:\lua   //path to lua54.dll
#flag -llua54
#include "lua.h"
#include "lauxlib.h"

struct C.luaState{
}

fn C.luaL_newstate() &C.luaState
fn C.luaL_openlibs(&C.luaState)
fn C.lua_close(&C.luaState)
fn C.luaL_dostring(&C.luaState,&char)int

fn main(){
   lst := C.luaL_newstate()
   C.luaL_openlibs(lst)
   _ := C.luaL_dostring(lst,c"print('hello')")
   C.lua_close(lst)
}
