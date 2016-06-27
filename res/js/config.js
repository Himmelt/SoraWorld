.pragma library

var model={};
var db;
function loadDB(vardb){
    db = vardb;
    db.transaction(
        function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS `userlist` (`id` INTEGER NOT NULL,`username` TEXT NOT NULL DEFAULT '',PRIMARY KEY(id,username))");
        }
    )
}

function loadConfig(){
    loadUsers();
}
function loadUsers(){
    db.transaction(
        function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS `userlist` (`id` INTEGER NOT NULL,`username` TEXT NOT NULL DEFAULT '',PRIMARY KEY(id,username))");
//            var result = tx.executeSql('select * from notes');
//            for(var i = 0; i < result.rows.length; i++) {
//                print(result.rows[i].text);
//            }
        }
    )
}
