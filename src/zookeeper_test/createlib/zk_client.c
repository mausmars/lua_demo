#include <lua.h>
#include <lauxlib.h>
#include <stdio.h>
#include <zookeeper/zookeeper.h>
#include <zookeeper/zookeeper_log.h>

static int lzookeeper_init(lua_State *L) {
    size_t host_sz = 0;
    const char *host = (const char *) luaL_checklstring(L, 1, &host_sz);
    watcher_fn fn = lua_tocfunction(L, 2);  //第2个参数是函数
    int recv_timeout = luaL_checkinteger(L, 3);
    const clientid_t *clientid = lua_touserdata(L, 4);
    void *context = lua_touserdata(L, 5);
    int flags = luaL_checkinteger(L, 6);
    zhandle_t *zkhandle = zookeeper_init(host, fn, recv_timeout, clientid, context, flags);

    //轻量级用户数据，返回c指针
    lua_pushlightuserdata(L, zkhandle);
    return 1;
}

int luaopen_zk_client(lua_State *L) {
    luaL_Reg l[] = {
            {"zookeeper_init", lzookeeper_init},
            {NULL, NULL},
    };
    luaL_newlib(L, l);
    return 1;
}