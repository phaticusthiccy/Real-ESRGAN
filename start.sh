# Easy Start With Shell Script 
# Based on https://colab.research.google.com/drive/1k2Zod6kSHEvraybHl50Lys0LerhyTMCo?usp=sharing#scrollTo=GnpnrLfMV2jU 
# @phaticusthiccy

GREEN="\033[0;32m"
BLUE="\033[0;34m"
RED="\033[0;31m"
NONE="\033[0m"

clear
cat shell-requirements/ascii.txt
sleep 1
printf "${GREEN}Welcome to ESRGAN. Please Select Your Language${NONE}"
printf "\n\n${BLUE}"
printf "1) English \n"
printf "2) Türkçe \n${NONE}>>> "
read opt
if [ $opt = '' ]; then
  printf "${RED}Nothing Selected! Exiting..${NONE} \n"
  exit;
else
  case $opt in
    1) clear;
        cat shell-requirements/ascii.txt
        printf "${GREEN}Installing Requirements..${NONE} \n"
        python shell-requirements/preparations.py
        clear 
        cat shell-requirements/ascii.txt
        printf "${GREEN}Select Your Image Path (ex: folder/picture.png) ${NONE} \n>>> "
        read pathen
        clear 
        cat shell-requirements/ascii.txt
        printf "${GREEN}Selected ${pathen} Image. Process Starting..${NONE} \n"
        python inference_realesrgan.py --model_path experiments/pretrained_models/RealESRGAN_x4plus.pth --input "${pathen}" --netscale 4 --outscale 3.5 --half --face_enhance
        clear 
        cat shell-requirements/ascii.txt
        printf "${GREEN}Process Finised! You Can Check Result!${NONE} \n"
        printf "$GREEN}Save Path: ./results ${NONE}"
        exit;
    2) clear;
        cat shell-requirements/ascii.txt
        printf "${GREEN}Gereksinimler Yükleniyor..${NONE} \n"
        python shell-requirements/preparations.py
        clear 
        cat shell-requirements/ascii.txt
        printf "${GREEN}Görüntü Yolunuzu Seçin (Örnek: dosya/resim.png) ${NONE} \n>>> "
        read pathtr
        clear 
        cat shell-requirements/ascii.txt
        printf "${GREEN}${pathen} Dosyası Seçildi. İşlem Başlıyor..${NONE} \n"
        python inference_realesrgan.py --model_path experiments/pretrained_models/RealESRGAN_x4plus.pth --input "${pathtr}" --netscale 4 --outscale 3.5 --half --face_enhance
        clear 
        cat shell-requirements/ascii.txt
        printf "${GREEN}İşlem Bitti! Sonucu Kontrol Edebilirsiniz!${NONE} \n"
        printf "$GREEN}Kayıt Yolu: ./results ${NONE}"
        exit;
  esac
fi
    
