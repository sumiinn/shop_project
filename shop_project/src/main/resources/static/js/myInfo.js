function showPage(pageId) {
    const contents = document.querySelectorAll('.content');
    contents.forEach(content => content.style.display = 'none');
    document.getElementById(pageId).style.display = 'block';
}

function selectMonth(button) {
    const buttons = document.querySelectorAll('.month-selector button');
    buttons.forEach(btn => btn.classList.remove('selected'));
    button.classList.add('selected');
}

function openPasswordModal() {
    document.getElementById('password-modal').style.display = 'block';
}

function closePasswordModal() {
    document.getElementById('password-modal').style.display = 'none';
}

document.getElementById('order-info').addEventListener('submit', function(event) {
    event.preventDefault();
    alert('주문 내역을 조회합니다.');
});

document.getElementById('password-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const newPassword = document.getElementById('new-password').value;
    const confirmPassword = document.getElementById('confirm-password').value;
    if (newPassword !== confirmPassword) {
        document.getElementById('password-error').style.display = 'block';
    } else {
        document.getElementById('password-error').style.display = 'none';
        closePasswordModal();
        alert('비밀번호가 변경되었습니다.');
    }
});

document.getElementById('user-info-form').addEventListener('submit', function(event) {
    event.preventDefault();
    alert('저장되었습니다.');
});

/*쿠키 호출 함수*/
let getCookie = function(name) {
	let value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)'); 
	return value? value[2] : null;  
};
 let LoginCheck = getCookie("LoginCheck"); 


// 로그인 유무 체크
if(LoginCheck==='false'){
	console.log('check')
	window.location.href = "http://localhost:8080/NonMajor5/index.html";
}
