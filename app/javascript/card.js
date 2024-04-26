const pay = () => {
  const publicKey = gon.public_key;
  console.log(publicKey);
  if (typeof Payjp !== 'undefined' && typeof Payjp.setPublicKey === 'function') {
    Payjp.setPublicKey(publicKey);  // PAY.JPテスト公開鍵を設定
    const elements = Payjp.elements();
    const numberElement = elements.create('cardNumber');
    const expiryElement = elements.create('cardExpiry');
    const cvcElement = elements.create('cardCvc');

    numberElement.mount('#number-form');
    expiryElement.mount('#expiry-form');
    cvcElement.mount('#cvc-form');
    const form = document.getElementById('charge-form')
    form.addEventListener("submit", (e) => {
      console.log("フォーム送信時にイベント発火")
      Payjp.createToken(numberElement).then(function (response) {
        if (response.error) {
        } else {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden">`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
        document.getElementById("charge-form").submit();
      });
      e.preventDefault();
    });
  } else {
    console.error('PAY.JPライブラリがロードされていない、またはsetPublicKeyメソッドが利用できません。');
  }
};

window.addEventListener('DOMContentLoaded', pay);
// window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);

