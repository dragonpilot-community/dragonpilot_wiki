//
// Online Random IMEI Number Generator
//
// By: LazyZhu (http://lazyzhu.com/)
//
// Modified from: http://bradconte.com/cc_generator
//

function imei_gen() {
    var pos;
    var str = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    var sum = 0;
    var final_digit = 0;
    var t = 0;
    var len_offset = 0;
    var len = 15;
    var issuer;

    //
    // Fill in the first two values of the string based with the specified prefix.
    // Reporting Body Identifier list: http://en.wikipedia.org/wiki/Reporting_Body_Identifier
    //

    var rbi = ["01","10","30","33","35","44","45","49","50","51","52","53","54","86","91","98","99"];
    var arr = rbi[Math.floor(Math.random() * rbi.length)].split("");
    str[0] = Number(arr[0]);
    str[1] = Number(arr[1]);
    pos = 2;

    //
    // Fill all the remaining numbers except for the last one with random values.
    //

    while (pos < len - 1) {
        str[pos++] = Math.floor(Math.random() * 10) % 10;
    }

    //
    // Calculate the Luhn checksum of the values thus far.
    //

    len_offset = (len + 1) % 2;
    for (pos = 0; pos < len - 1; pos++) {
        if ((pos + len_offset) % 2) {
            t = str[pos] * 2;
            if (t > 9) {
                t -= 9;
            }
            sum += t;
        }
        else {
            sum += str[pos];
        }
    }

    //
    // Choose the last digit so that it causes the entire string to pass the checksum.
    //

    final_digit = (10 - (sum % 10)) % 10;
    str[len - 1] = final_digit;

    // Output the IMEI value.
    t = str.join('');
    t = t.substr(0, len);
    document.getElementById('imei_num').value = t;
}
