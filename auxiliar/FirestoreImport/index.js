const admin = require('./node_modules/firebase-admin');
const serviceAccount = require("./fiscalizarecife-ae4f0-firebase-adminsdk-vodsu-9a2d267c61.json");
const data = require("./totais.json");
const collectionKey = "totais_receitas";//name of the collection


admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://fiscalizarecife-default-rtdb.firebaseio.com"
});


const firestore = admin.firestore();

const settings = { timestampsInSnapshots: true };
firestore.settings(settings);

if (data && (typeof data === "object")) {
    Object.keys(data).forEach(docKey => {
        firestore.collection(collectionKey).doc(docKey).set(data[docKey]).
            then((res) => {
                console.log("Document " + docKey + " successfully written!");
            }).catch((error) => {
                console.error("Error writing document: ", error);
            });
    });
}