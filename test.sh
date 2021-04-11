
gen_pt_pin_array() {
    local tmp1 tmp2 i pt_pin_temp
    for ((user_num = 1; user_num <= $user_sum; user_num++)); do
        tmp1=Cookie$user_num
        tmp2=${!tmp1}
        i=$(($user_num - 1))
        pt_pin_temp=$(echo $tmp2 | perl -pe "{s|.*pt_pin=([^; ]+)(?=;?).*|\1|; s|%|\\\x|g}")
        [[ $pt_pin_temp == *\\x* ]] && pt_pin[i]=$(printf $pt_pin_temp) || pt_pin[i]=$pt_pin_temp
        echo -n $(echo -n "$pt_pin_temp" | sha1sum | cut -f1 -d ' ') >> 
    done
}