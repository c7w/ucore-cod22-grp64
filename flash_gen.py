
objects = [
    (0x0, r"D:\ComputerOrganization\video.bin"),
    (0x70_0000, r"D:\ComputerOrganization\rv-2022\asmcode\flash_move.bin"),
    (0x70_8000, r"labcodes_answer\lab8\bin\rbl.img"),
    (0x71_0000, r"labcodes_answer\lab8\bin\ucore.img"),   
]

capacity = 8 * 1024 * 1024

if __name__ == "__main__":
    flash = b"0" * capacity
    for adr, img in objects:
        with open(img, "rb") as f:
            byte_stream = f.read()
            byte_len = len(byte_stream)
            print(img, "Read", byte_len)
            flash_pre = flash[:adr]
            flash_post = flash[adr + byte_len:]
            flash = flash_pre + byte_stream + flash_post
            print(" > Flash Range [0x%08X, 0x%08X]" % (adr, adr + byte_len - 1))
    with open("out.flash", "wb") as f:
        f.write(flash)


