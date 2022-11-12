void main() {

  print('Factorial de 4 :');
  print(factorial(5).toString());
}

num factorial(num n) {
  if (n == 1)  {
    return 1;
  }
  else {
    return n * factorial(n -1);
  }
}