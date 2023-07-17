const messageBar = document.querySelector(".bar-wrapper input");
const sendBtn = document.querySelector(".bar-wrapper button");
const messageBox = document.querySelector(".message-box");

let API_URL = "https://api.openai.com/v1/chat/completions";
let API_KEY = "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";
let isChatting = false;

window.onload = function() {
  const savedMessages = localStorage.getItem("chatMessages");
  if (savedMessages) {
    messageBox.innerHTML = savedMessages;
  }
}

sendBtn.onclick = function () {
  if (!isChatting && messageBar.value.length > 0) {
    isChatting = true;
    const UserTypedMessage = messageBar.value;
    messageBar.value = "";
    messageBar.disabled = true;
    sendBtn.disabled = true;

    let message =
    `<div class="chat message">
    <img src="img/user.jpg">
    <span>
      ${UserTypedMessage}
    </span>
  </div>`;

    let response = 
    `<div class="chat response">
    <img src="img/chatbot.jpg">
    <span class= "new">...
    </span>
  </div>`

    messageBox.insertAdjacentHTML("beforeend", message);

    setTimeout(() =>{
      messageBox.insertAdjacentHTML("beforeend", response);

      const requestOptions = {
        method : "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${API_KEY}`
        },
        body: JSON.stringify({
          "model": "gpt-3.5-turbo",
          "messages": [{"role": "user", "content": UserTypedMessage}]
        })
      }

      fetch(API_URL, requestOptions).then(res => res.json()).then(data => {
        const ChatBotResponse = document.querySelector(".response .new");
        ChatBotResponse.innerHTML = data.choices[0].message.content;
        ChatBotResponse.classList.remove("new");
        isChatting = false;
        messageBar.disabled = false;
        sendBtn.disabled = false;

        const chatMessages = messageBox.innerHTML;
        localStorage.setItem("chatMessages", chatMessages);
      }).catch((error) => {
        const ChatBotResponse = document.querySelector(".response .new");
        ChatBotResponse.innerHTML = "Opps! An error occurred. Please try again";
        isChatting = false;
        messageBar.disabled = false;
        sendBtn.disabled = false;
      })
    }, 100);
  }
}
