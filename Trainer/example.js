var clarifai;

// on document ready, instantiate the Clarifai object
function init(){
    clarifai = new Clarifai(
        {
            'clientId': 'clhEl5A72CMmQiFxVCCvATADbTE7ngNAg_5Zhv2G',
            'clientSecret': '1mpy0xORIcx4rduZJ6wr7OjwkMKX2WWL-n1lkPG0'
        }
    );
    
    
    
    alert('gsdg');
}

function test ()
{
	for (var i = 0; i < phishPositives.length; ++i)
	{
		clarifai.positive(phishPositives[i], 'beard');
	
	}
	
	for (var i = 0; i < phishNegatives.length; ++i)
	{
		clarifai.negative(phishNegatives[i], 'beard');
	
	}
    
    train();
}

// send a 'positive' url
function positive(){
    clarifai.positive(phishPositives[0], 'beard', cb).then(
        promiseResolved,
        promiseRejected 
    );
}

// send a 'negative' url
function negative(){
    clarifai.negative(phishNegatives[0], 'beard', cb).then(
        promiseResolved,
        promiseRejected 
    );
}

// explicitly train our concept
function train(){
    clarifai.train('beard', cb).then(
        promiseResolved,
        promiseRejected 
    );
}

// make a prediction on a url with our concept
function predict(){
    clarifai.predict('http://farm3.static.flickr.com/2161/2141620332_2b741028b3.jpg', 'beard', cb).then(
        promiseResolved,
        promiseRejected 
    );
}

function promiseResolved(obj){
    console.log('promiseResolved', obj);
}

function promiseRejected(obj){
    console.log('promiseRejected', obj);
}

function cb(obj){
    console.log('cb', obj);
}

var phishPositives = [
  'http://cdn2.spiegel.de/images/image-788879-panoV9free-ohuv.jpg',
  'http://www.photocase.de/stock-fotos/422374-stock-photo-mann-erwachsene-traurigkeit-bart-erwartung-schwarzhaarig.jpg',
  'http://www.mucbook.de/wp-content/uploads/2011/11/5519092534_f2f8325d55.jpg',
  'http://thumbs.dreamstime.com/x/mann-mit-einem-buschigen-bart-der-einen-kuss-durchbrennt-19896797.jpg',
  'http://www.handelszeitung.ch/sites/handelszeitung.ch/files/imagecache/teaser-big/lead_image/bart.jpg',
  'http://media.menexpert.de/filer_public/83/a7/83a7b5a1-00d6-4408-804d-e7d492f4ba3a/bart-wachsen-lassen-1.jpg',
  'http://www.schminken.de/wp-content/uploads/2013/02/Stoppelbart-5.jpg'
];

var phishNegatives = [
  'http://cdn.jolie.de/bilder/ohne-bart-ii-1857817.jpg',
  'http://autoimg.vip.de/voting/00001617_2/292x0/jolie-liebesentzug-fuer-brad-pitt.jpg',
  'http://www.manager-magazin.de/images/image-750617-mmo_panoV9-spyf.jpg',
  'http://steezo.com/wp-content/uploads/2012/12/man-in-suit2.jpg',
  'http://img.crazyhdsource.com/wp-content/cover/files/A.Gifted.Man.S01.720p.WEB-DL.DD5.1.H.264-CtrlHD.jpg',
  'http://static3.businessinsider.com/image/52b235196bb3f776493e69dd/north-dakota-says-man-in-same-sex-marriage-can-also-marry-a-woman.jpg',
  'http://nightdrivemiami.com/wp-content/uploads/2012/08/tin_man_bw.png',
  'http://static.guim.co.uk/sys-images/Guardian/About/General/2013/1/3/1357230493554/Man-Booker-Prize-judges-p-011.jpg'
];

$(document).ready(init);