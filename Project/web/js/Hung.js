
let timeIdsArray = [];
let timeIdDelete = [];

function addFreeScheduleList(tdElement) {
    const timeID = tdElement.querySelector('.timeID').value;
    if (tdElement.classList.contains('selected-time') && !tdElement.classList.contains('deleted-time')) {
        tdElement.classList.remove('selected-time');
        tdElement.classList.add('deleted-time');
        timeIdDelete.push(timeID);
        const index = timeIdsArray.indexOf(timeID);
        if (index > -1) {
            timeIdsArray.splice(index, 1);
        }
    } else if (tdElement.classList.contains('deleted-time') && !tdElement.classList.contains('selected-time')) {
        tdElement.classList.remove('deleted-time');
        tdElement.classList.add('selected-time');
        const indexd = timeIdDelete.indexOf(timeID);
        if (indexd > -1) {
            timeIdDelete.splice(indexd, 1);
        }
        timeIdsArray.push(timeID);
    } else if (!tdElement.classList.contains('selected-time') && !tdElement.classList.contains('deleted-time')) {
        tdElement.classList.add('selected-time');
        timeIdsArray.push(timeID);
    }
    const selectedSeats = document.querySelectorAll('.selected-time');
    const selectedSeatsd = document.querySelectorAll('.deleted-time');
    const timeNumbersd = Array.from(selectedSeatsd).map(time => time.textContent.trim());
    const timeNumbers = Array.from(selectedSeats).map(time => time.textContent.trim());
    document.getElementById('selectedFreeSchecduleDisplay').textContent = timeNumbers.join(', ');
    document.getElementById('selectedFreeSchecduleDisplayd').textContent = timeNumbersd.join(', ');
    // truyen du lieu
    document.getElementById('time').value = timeIdsArray.join(', ');
    document.getElementById('timedelete').value = timeIdDelete.join(', ');
    console.log(timeID);
}

function checkFreeSBeforeSubmit() {
    let selectedSchedule = document.getElementById("selectedFreeSchecduleDisplay").textContent;
    if (selectedSchedule.trim() === "") {
        alert("Vui lòng chọn ít nhất một lịch rảnh trước khi tiến hành xác nhận!");
        return false;
    }
    return true;
}

