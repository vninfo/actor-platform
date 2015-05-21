package im.actor.model.api.updates;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.model.droidkit.bser.Bser;
import im.actor.model.droidkit.bser.BserParser;
import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import im.actor.model.droidkit.bser.DataInput;
import im.actor.model.droidkit.bser.DataOutput;
import im.actor.model.droidkit.bser.util.SparseArray;
import static im.actor.model.droidkit.bser.Utils.*;
import java.io.IOException;
import im.actor.model.network.parser.*;
import java.util.List;
import java.util.ArrayList;
import im.actor.model.api.*;

public class UpdateConfig extends Update {

    public static final int HEADER = 0x2a;
    public static UpdateConfig fromBytes(byte[] data) throws IOException {
        return Bser.parse(new UpdateConfig(), data);
    }

    private Config config;

    public UpdateConfig(Config config) {
        this.config = config;
    }

    public UpdateConfig() {

    }

    public Config getConfig() {
        return this.config;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.config = values.getObj(1, new Config());
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        if (this.config == null) {
            throw new IOException();
        }
        writer.writeObject(1, this.config);
    }

    @Override
    public String toString() {
        String res = "update Config{";
        res += "config=" + this.config;
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}
