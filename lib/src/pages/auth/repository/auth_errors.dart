String authErrorsString(String errorcode) {
  switch (errorcode) {
    case 'INVALID_CREDENTIALS':
      return 'E-mail/Senha inválidos';
    case 'EMAIL_NOT_FOUND':
      return 'E-mail não encontrado';
    case 'INVALID_PASSWORD':
      return 'Senha inválida';
    case 'EMAIL_EXISTS':
      return 'E-mail já existe';
    case 'Ivalid_session_token':
      return 'Sessão inválida';
    default:
      return 'Erro na autenticação';
  }
}
