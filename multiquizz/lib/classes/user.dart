class User {
    var id;
    var name;
    var pwHash;
    var score;

    User(String name)
    {
        // db-Aufruf - fill member
        this.name = name;
    }
}