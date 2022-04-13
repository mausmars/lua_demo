#include <lua.h>
#include <lauxlib.h>
#include <stdio.h>

typedef struct NumArray {
    int size;
    double values[1];  /* variable part */
} NumArray;

static int newarray(lua_State *L) {
    int n = luaL_checkinteger(L, 1);
    size_t nbytes = sizeof(NumArray) + (n - 1)*sizeof(double);
    NumArray *a = (NumArray *)lua_newuserdata(L, nbytes);
    a->size = n;
    return 1; /* new userdatum is already on the stack */
}

static int setarray(lua_State *L) {
    NumArray *a = (NumArray *)lua_touserdata(L, 1);
    int index = luaL_checkinteger(L, 2);
    double value = luaL_checknumber(L, 3);
    luaL_argcheck(L, a != NULL, 1, "`array' expected");
    luaL_argcheck(L, 1 <= index && index <= a->size, 2, "index out of range");
    a->values[index-1] = value;
    return 0;
}

static int getarray(lua_State *L) {
    NumArray *a = (NumArray *)lua_touserdata(L, 1);
    int index = luaL_checkinteger(L, 2);
    luaL_argcheck(L, a != NULL, 1, "'array' expected");
    luaL_argcheck(L, 1 <= index && index <= a->size, 2,"index out of range");
    lua_pushnumber(L, a->values[index-1]);
    return 1;
}

static int getsize(lua_State *L) {
    NumArray *a = (NumArray *)lua_touserdata(L, 1);
    luaL_argcheck(L, a != NULL, 1, "`array' expected");
    lua_pushnumber(L, a->size);
return 1;
}

int luaopen_ctest(lua_State *L) {
    luaL_Reg l[] = {
        {"new", newarray},
        {"set", setarray},
        {"get", getarray},
        {"size", getsize},
        {NULL, NULL}
     };
    luaL_newlib(L, l);
    return 1;
};
