function validateName(data) {
    return /\s*[a-zA-Zà-ıÀ-İ\s]+\s*$/.test(data)
}