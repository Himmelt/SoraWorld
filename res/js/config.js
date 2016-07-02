.pragma library

.import QtQuick.LocalStorage 2.0 as SQL

/* Open Database */
var db = SQL.LocalStorage.openDatabaseSync("SoraClient", "1.0", "SoraClient", 10000),
    model;
/* Initialize Tables */
db.transaction(
    function (tx) {
        tx.executeSql("create table if not exists `userlist` \
            (`id` integer not null,`username` text not null default '',primary key(id,username))");
        tx.executeSql("create table if not exists `userinfo` \
            (`id` integer not null,`username` text not null default '',primary key(id,username))");
    }
);
/* Load Model */
function loadModel(listmodel) {
    model = listmodel;
    console.log("model:", model, "list", listmodel);
}

function test() {
    model.append({
        username: "Himmelt"
    });
}
/* Save Model */
function saveModel() {
    db.transaction(
        function (tx) {
            tx.executeSql("create table if not exists `userlist` (`id` integer not null,`username` text not null default '',primary key(id,username))");
            tx.executeSql("delete from `userinfo` where `username` not in `userlist`");
        }
    )
}
