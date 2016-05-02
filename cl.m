    % 查找串口对象
    scoms = instrfind;
    % 尝试停止、关闭删除串口对象
    stopasync(scoms);
    fclose(scoms);
    delete(scoms);