//전체 체크박스 선택
function checkSelectAll() {
    const checkboxes = document.getElementsByName('delete_checkbox');
    const selectAllCheckbox = document.getElementById('select_all_checkbox');
    const isAllChecked = selectAllCheckbox.checked;

    for (const checkbox of checkboxes) {
        checkbox.checked = isAllChecked;
    }
}

//개인 체크박스 전체 or 개인으로 인한 전체 체크박스 선택 true, false
function checkSelect() {
    const checkboxes = document.getElementsByName('delete_checkbox');
    const selectAllCheckbox = document.getElementById('select_all_checkbox');
    
    let allChecked = true;
    for (const checkbox of checkboxes) {
        if (!checkbox.checked) {
            allChecked = false;
            break;
        }
    }

    selectAllCheckbox.checked = allChecked;
}