//example how to make a lua module in V
//compile with v -cc gcc -shared -o module.dll module.v

#flag -Ic:\lua\source   //path to lua.h and lauxlib.h
#flag -Lc:\lua   //path to lua54.dll
#flag -llua54
#include "lua.h"
#include "lauxlib.h"

struct C.luaState{
}

type Lua_CFunction = fn (voidptr)int

fn C.lua_newtable(&C.luaState)
fn C.lua_pushvalue(&C.luaState,int)
fn C.lua_pushcfunction(&C.luaState,Lua_CFunction)
fn C.lua_setfield(&C.luaState,int,&char)

fn faz(l voidptr)int{
   println('hello from v!')
   return 1
}

[export: 'luaopen_module']
fn luaopen_module(l voidptr)int{
   C.lua_newtable(l)
   C.lua_pushvalue(l,-1)
   C.lua_pushcfunction(l,faz)
   C.lua_setfield(l,-2, c"faz")
   return 1
}
