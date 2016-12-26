/**
 * Created by kbataykin on 26/09/16.
 */
var bitrates = {
    dash: 'https://strm-msknrd.showjet.ru/rc-01/noenc/hd_audio/6b454fe2-99ef-47d3-934a-fb2ae940d82a.ism/.mpd?max_bitrate=2500000'
};
// Then our MPEG-DASH custom protection data
var protectionData = {
    "com.widevine.alpha": {
        "serverURL": "https://irdeto.showjet.ru/widevine/getlicense?ContentId=1993_Grandfather_S01_E01&CrmId=showjet&AccountId=showjet&SessionId=50FA630778C13DBF&Ticket=A50A409194AA2163",

    },
    "com.microsoft.playready": {
        "serverURL": "http://drm-playready-licensing.axtest.net/AcquireLicense",
        "httpRequestHeaders": {
            "X-AxDRM-Message": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ2ZXJzaW9uIjoxLCJjb21fa2V5X2lkIjoiNjllNTQwODgtZTllMC00NTMwLThjMWEtMWViNmRjZDBkMTRlIiwibWVzc2FnZSI6eyJ0eXBlIjoiZW50aXRsZW1lbnRfbWVzc2FnZSIsImtleXMiOlt7ImlkIjoiNmU1YTFkMjYtMjc1Ny00N2Q3LTgwNDYtZWFhNWQxZDM0YjVhIn1dfX0.yF7PflOPv9qHnu3ZWJNZ12jgkqTabmwXbDWk_47tLNE"
        }
    }
};
// Then we set our player settings
var settings = {
    licenseKey: 'Y2lla21xZXNrbyEqXyVjPWt6N3NpK3ZvYz1rejJvOD9yb201ZGFzaXMzMGRiMEElXyo=',
    bitrates: bitrates,
    delayToFade: 3000,
    width: 640,
    height: 360,
    dashProtectionData: protectionData,
    debug: true,
    streamDebug: true,
    skin: 's1',
    poster: 'https://www.radiantmediaplayer.com/images/poster-rmp-showcase.jpg'
};
// Reference to the wrapper div (unique id)
var element = 'rmpPlayer';
// Create an object based on RadiantMP constructor
var rmp = new RadiantMP(element);
// Initialization ... test your page and done!
rmp.init(settings);