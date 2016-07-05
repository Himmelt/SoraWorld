.pragma library
.import QtQuick.LocalStorage 2.0 as SQL

/* Open Database */
var db = SQL.LocalStorage.openDatabaseSync("SoraClient", "1.0", "SoraClient", 10000),
    model,rootPath = "fuck";
/* Initialize Tables */
db.transaction(
    function (tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS `userlist` (`username` TEXT,`password` TEXT)");
    }
);
/* Load rootPath */
function loadPath(path){
    console.log(path)
    rootPath = path;
    console.log(rootPath)
}

/* Load Model */
function loadModel(listmodel) {
    model = listmodel;
    db.transaction(function (tx) {
        var rs = tx.executeSql("select * from userlist"),
            i = rs.rows.length;
        while (i--) {
            var item = rs.rows.item(i);
            model.append({
                username: item.username,
                password: item.password
            });
        }
    });
}
/* Save Model */
function saveModel() {
    db.transaction(function (tx) {
        tx.executeSql("delete from `userlist`");
        var i = model.count;
        while (i--) {
            var item = model.get(i);
            tx.executeSql("insert into `userlist` values (?,?)", [item.username, item.password]);
        }
    });
}
