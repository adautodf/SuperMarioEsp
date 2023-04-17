#define btn_left 15
#define btn_right 18
#define btn_jump 13

int flag_btn_left = 0;
int flag_btn_right = 0;
int flag_btn_jump = 0;

void setup(){
  pinMode(btn_left, INPUT_PULLUP);
  pinMode(btn_right, INPUT_PULLUP);
  pinMode(btn_jump, INPUT_PULLUP);

  Serial.begin(115200);
}

void loop(){
  if (deBounce(flag_btn_left, btn_left) == LOW){
    Serial.write("ESQUERDA 1\n");
    flag_btn_left = 1;
    
  }
  if (deBounce(flag_btn_left, btn_left) == HIGH){
    if (flag_btn_left == 1){
      Serial.write("Solto 1\n");
    }
    flag_btn_left = 0;
    
  }

  if (deBounce(flag_btn_jump, btn_jump) == HIGH){
    if (flag_btn_jump == 1){
      Serial.write("Solto 2\n");
    }
    flag_btn_jump = 0;
    
  }
  if (flag_btn_jump == 0 && deBounce(flag_btn_jump, btn_jump) == LOW){
    Serial.write("PULA 2\n");
    flag_btn_jump = 1;
    
  }
  if (deBounce(flag_btn_right, btn_right) == LOW){
    Serial.write("DIREITA 3\n");
      flag_btn_right = 1;
      
    }

    if (deBounce(flag_btn_right, btn_right) == HIGH){
      if (flag_btn_right == 1){
        Serial.write("Solto 3\n");
      }
      flag_btn_right = 0;
      
    }
  }


int deBounce(int estado, int pino){
  int estadoAtual = digitalRead(pino);
  if (estado != estadoAtual){
    delay(5);
    estadoAtual = digitalRead(pino);
  }
  return estadoAtual;
}
